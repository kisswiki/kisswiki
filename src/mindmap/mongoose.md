- schema
  - code
    ```javascript
    const mongoose = require("mongoose");
    const geolocationSchema = mongoose.Schema({
      ip_or_url: { type: String, default: null },
    });
    module.exports = mongoose.model("geolocation", geolocationSchema);
    ```
