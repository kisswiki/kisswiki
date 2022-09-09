- schema

  - code

    ```javascript
    // model/geolocation.js
    const mongoose = require("mongoose");
    const geolocationSchema = mongoose.Schema({
      ip_or_url: { type: String, default: null },
    });
    module.exports = mongoose.model("geolocation", geolocationSchema);

    // app.js
    const Geolocation = require("./model/geolocation");
    const geolocation = await Geolocation.create({ url_or_ip, data });
    ```
