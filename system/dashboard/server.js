#!/usr/bin/env node
// Minimal local HTTP server for the ClawFlows dashboard.
// Usage: node server.js <port> <cli_path> <template_path>
// Port 0 = pick a random free port.
// Prints http://127.0.0.1:<port> to stdout on startup, then suppresses logs.

const http = require('http');
const fs = require('fs');
const { execFile, spawn } = require('child_process');

const port = parseInt(process.argv[2] || '0', 10);
const cliPath = process.argv[3];
const templatePath = process.argv[4];

if (!cliPath || !templatePath) {
  process.stderr.write('usage: node server.js <port> <cli_path> <template_path>\n');
  process.exit(1);
}

function runCli(args, cb, stdin) {
  var child = execFile(cliPath, args, { env: process.env }, function (err, stdout, stderr) {
    if (err) return cb(err, stderr || err.message);
    cb(null, stdout);
  });
  if (stdin) {
    child.stdin.write(stdin);
    child.stdin.end();
  }
}

const server = http.createServer(function (req, res) {
  // GET / — serve the HTML template
  if (req.method === 'GET' && req.url === '/') {
    fs.readFile(templatePath, 'utf8', function (err, html) {
      if (err) { res.writeHead(500); res.end('template read error'); return; }
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
      res.end(html);
    });
    return;
  }

  // GET /api/workflows — JSON list
  if (req.method === 'GET' && req.url === '/api/workflows') {
    runCli(['dashboard', '--json'], function (err, out) {
      if (err) { res.writeHead(500); res.end(JSON.stringify({ error: out })); return; }
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(out);
    });
    return;
  }

  // GET /api/runs — run history JSON
  if (req.method === 'GET' && req.url === '/api/runs') {
    runCli(['dashboard', '--runs-json'], function (err, out) {
      if (err) { res.writeHead(500); res.end(JSON.stringify({ error: out })); return; }
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(out);
    });
    return;
  }

  // POST /api/enable/<name>
  var enableMatch = req.method === 'POST' && req.url.match(/^\/api\/enable\/([a-zA-Z0-9_-]+)$/);
  if (enableMatch) {
    var name = enableMatch[1];
    runCli(['enable', name], function (err, out) {
      res.writeHead(err ? 500 : 200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ ok: !err, message: (out || '').trim() }));
    });
    return;
  }

  // POST /api/disable/<name>
  var disableMatch = req.method === 'POST' && req.url.match(/^\/api\/disable\/([a-zA-Z0-9_-]+)$/);
  if (disableMatch) {
    var dname = disableMatch[1];
    runCli(['disable', dname], function (err, out) {
      res.writeHead(err ? 500 : 200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ ok: !err, message: (out || '').trim() }));
    });
    return;
  }

  // POST /api/edit/<name> — copy to custom if needed, then open in editor
  var editMatch = req.method === 'POST' && req.url.match(/^\/api\/edit\/([a-zA-Z0-9_-]+)$/);
  if (editMatch) {
    var ename = editMatch[1];
    runCli(['edit', ename], function () {
      runCli(['open', ename], function (err, out) {
        res.writeHead(err ? 500 : 200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ ok: !err, message: (out || '').trim() }));
      });
    });
    return;
  }

  // POST /api/run/<name> — fire-and-forget workflow run
  var runMatch = req.method === 'POST' && req.url.match(/^\/api\/run\/([a-zA-Z0-9_-]+)$/);
  if (runMatch) {
    var rname = runMatch[1];
    var child = spawn(cliPath, ['run', rname], {
      detached: true, stdio: 'ignore', env: process.env
    });
    child.unref();
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ ok: true, message: 'Running ' + rname }));
    return;
  }

  // POST /api/create — create a new workflow from JSON body
  if (req.method === 'POST' && req.url === '/api/create') {
    var body = '';
    req.on('data', function (chunk) { body += chunk; });
    req.on('end', function () {
      runCli(['create', '--from-json'], function (err, out) {
        res.writeHead(err ? 500 : 200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ ok: !err, message: (out || '').trim() }));
      }, body);
    });
    return;
  }

  res.writeHead(404);
  res.end('not found');
});

server.listen(port, '127.0.0.1', function () {
  var addr = server.address();
  // Print URL on first line so the bash wrapper can read it
  process.stdout.write('http://127.0.0.1:' + addr.port + '\n');
});
