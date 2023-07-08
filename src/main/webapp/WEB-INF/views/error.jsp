<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Error</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
    .container-error {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        text-align: center;
        font-family: sans-serif;
        background-color: #E7FFFF;
    }

    h1, a {
        margin: 0;
        padding: 0;
        text-decoration: none;
    }

    .section {
        padding: 4rem 2rem;
    }

    .section .error {
        font-size: 100px;
        color: #008B62;
        text-shadow: 1px 1px 1px #00593E,
        2px 2px 1px #00593E,
        3px 3px 1px #00593E,
        4px 4px 1px #00593E,
        5px 5px 1px #00593E,
        6px 6px 1px #00593E,
        7px 7px 1px #00593E,
        8px 8px 1px #00593E,
        25px 25px 8px rgba(0, 0, 0, 0.2);
    }

    .page {
        margin: 2rem 0;
        font-size: 20px;
        font-weight: 600;
        color: #444;
    }

    .back-home {
        display: inline-block;
        border: 2px solid #222;
        color: #222;
        text-transform: uppercase;
        font-weight: 600;
        padding: 0.75rem 1rem 0.6rem;
        transition: all 0.2s linear;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.3);
    }

    .back-home:hover {
        background: #222;
        color: #ddd;
    }
</style>
<body style="background-color: #f7f7f7">
<div class="wrap_register">
  <section class="__register mt-5">
    <div class="container-error text-center">
      <div class="section">
        <h1 class="error status-code">${statusCode} ${page}</h1>
        <div class="page message">${message}</div>
        <a class="back-home" href="${redirect}">Back to home</a>
      </div>
    </div>
  </section>
</div>
</body>
</html>
