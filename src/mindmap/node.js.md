- The "chunk" argument must be of type string or an instance of Buffer
  - `res.write(JSON.stringify(data));`
    - https://stackoverflow.com/questions/61865764/the-chunk-argument-must-be-of-type-string-or-an-instance-of-buffer/61869307#61869307
- reusable function to send request and handle response
  test.mjs

  ```javascript
  const createRequest = (options, data) => {
    return new Promise((resolve, reject) => {
      const result = {};
      const req = http.request(options, (res) => {
        let rawData = "";
        res.setEncoding("utf8");
        res.on("data", (chunk) => {
          rawData += chunk;
        });
        res.on("end", () => {
          result.status = res.status || 200;
          result.data = rawData;
          resolve(result);
        });
      });
      req.on("error", (e) => {
        result.status = 500;
        result.data = {
          message: "ERROR: API response",
          exception: e,
        };
        reject(result);
      });
      req.write(JSON.stringify(data));
      req.end();
    });
  };

  const options = (path, data) => ({
    hostname: "localhost",
    port: 4002,
    path,
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Content-Length": Buffer.byteLength(JSON.stringify(data)),
    },
  });

  const postData = {
    email: process.env.EMAIL,
    password: process.env.PASSWORD,
  };

  let result = await createRequest(options("/login", postData), postData);
  const token = JSON.parse(result.data).token;
  ```

  ```
  % node test.mjs
  ```

  - https://stackoverflow.com/questions/60878067/nodejs-https-module-create-reusable-function-to-send-request-and-handle-response/60879910#60879910
  - https://nodejs.org/api/http.html#httprequesturl-options-callback

- top-level await
  - you cannot use top-level await in any CommonJS code
    - https://formidable.com/blog/2021/node-esm-and-exports/
  - use mjs extension
    - https://stackoverflow.com/questions/46515764/how-can-i-use-async-await-at-the-top-level/68756418#68756418
  - for stdin
    - `node --input-type=module --eval="const asyncMsg = await Promise.resolve('WORKS!'); console.log(asyncMsg);"`
      - https://www.stefanjudis.com/today-i-learned/top-level-await-is-available-in-node-js-modules/
- STATUS_CODES
  `node --print "JSON.stringify(Object.entries(http.STATUS_CODES).reduce((acc, [key, value]) => (acc[value] = key, acc), {}))" | jq '.'`
  - https://stackoverflow.com/questions/25146687/list-of-node-js-http-status-codes#comment130144158_25146688
