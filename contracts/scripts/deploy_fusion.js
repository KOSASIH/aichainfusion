async function deployFusion () {
  // Initialize your contract factory here, for example:

  // Deploy your contract here, for example:
  const yourFusionContract = await contractFactory.deploy('YourFusionContract')
  await yourFusionContract.deployed()

  console.log(`YourFusionContract deployed to: ${yourFusionContract.address}`)
}

deployFusion()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
