async function deployFunctions () {
  // Initialize your contract factory here, for example:

  // Deploy your contract here, for example:
  const yourFunctionContract = await contractFactory.deploy(DeFiLendingFunctions.sol)
  await yourFunctionContract.deployed()

  console.log(
    `YourFunctionContract deployed to: ${yourFunctionContract.address}`
  )
}

deployFunctions()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
