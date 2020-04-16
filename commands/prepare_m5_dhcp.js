const util = require('util');
const exec = util.promisify(require('child_process').exec);
const config = require('../etc/config');

// eslint-disable-next-line camelcase
module.exports = async function prepare_m5_dhcp() {
  try {
    await exec(`bash ./commands/prepare_m5_dhcp.bash ${config.airos_roter_ip}`);
  } catch (error) {
    return { code: error.code, message: error.stderr };
  }
  return 0;
};
