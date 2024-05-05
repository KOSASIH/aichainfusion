async function deployFusion() {
  // Initialize your contract factory here, for example:
  const contractFactory = await ethers.getContractFactory(CrossChainBridge.sol);

  // Deploy your contract here, for example:
  const yourFusionContract = await contractFactory.deploy();
  await yourFusionContract.deployed();

  console.log(`YourFusionContract deployed to: ${yourFusionContract.address}`);
}

deployFusion()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
