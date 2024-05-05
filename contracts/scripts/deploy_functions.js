async function deployFunctions () {
  // Import the contract artifact here, for example:
  const {
    abi,
    bytecode
  } = require('../artifacts/contracts/YourFunctionContract.sol/YourFunctionContract.json')

  // Connect to the blockchain using a Provider
  const provider = ethers.getDefaultProvider('rinkeby')

  // Initialize your contract factory here, for example:
  const contractFactory = new ethers.ContractFactory(abi, bytecode, provider)

  // Deploy your contract here, for example:
  const yourFunctionContract = await contractFactory.deploy(
    'yourFunctionContract'
  )
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
