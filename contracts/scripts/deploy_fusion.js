async function deployFusion() {
  // Import the contract artifact here, for example:
  const { abi, bytecode } = require('../artifacts/contracts/YourFusionContract.sol/YourFusionContract.json');

  // Connect to the blockchain using a Provider
  const provider = ethers.getDefaultProvider('rinkeby');

  // Initialize your contract factory here, for example:
  const contractFactory = new ethers.ContractFactory(abi, bytecode, provider);

  // Deploy your contract here, for example:
  const yourFusionContract = await contractFactory.deploy('YourFusionContract');
  await yourFusionContract.deployed();

  console.log(`YourFusionContract deployed to: ${yourFusionContract.address}`);
}

deployFusion()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
