async function deployChainlink () {
  // Initialize your contract factory here, for example:
  const contractFactory = await ethers.getContractFactory(
    DecentralizedExchange.sol
  )

  // Deploy your contract here, for example:
  const yourChainlinkContract = await contractFactory.deploy()
  await yourChainlinkContract.deployed()

  console.log(
    `YourChainlinkContract deployed to: ${yourChainlinkContract.address}`
  )
}

deployChainlink()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
