require('dotenv').config();

module.exports = {
  launch: {
    headless: process.env.HEADLESS === 'true'
  },
  server: {
    command: 'npx http-server --port 9000 __fakes__/nauta/',
    port: 9000,
  },
};
