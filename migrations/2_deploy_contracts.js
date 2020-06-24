const StarNotary = artifacts.require("StarNotary");
const StarNotaryProxy = artifacts.require("StarNotaryProxy");

module.exports = function(deployer) {
  deployer.deploy(StarNotary);
  deployer.deploy(StarNotary);
};
