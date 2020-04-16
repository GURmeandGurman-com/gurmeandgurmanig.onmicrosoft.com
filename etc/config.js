require('dotenv').config();

const config = {
  port: parseInt(process.env.PORT, 10) || 4500,
  headless: process.env.HEADLESS !== 'false',
  creds: {
    username: process.env.NAUTA_USER,
    password: process.env.NAUTA_PASSWORD
  },
  airos_roter_ip: process.env.AIROS_ROUTER_IP || null,
  before_connect: process.env.BEFORE_CONNECT || null,
  timeout: parseInt(process.env.TIMEOUT, 10) || 8000,
  nauta_login: {
    loginURL: process.env.NAUTA_URL || null,
    maxDisconnectionAttempts: parseInt(process.env.MAX_DISCONNECTION_ATTEMPTS, 10) || 2
  }
};

Object.freeze(config);
module.exports = config;
