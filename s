// Step 1: Connect to your local Solana Devnet
connection = new Connection("http://127.0.0.1:8899","confirmed");
const version = await connection.getVersion();
console.log('Connection to cluster established:', version);
//Step 2: Generate a keypair - this would be an account that pays for the calls to the program
payer = Keypair.generate();
console.log("Public Key of Payer is:", payer.publicKey.toString());
//Step 3: Requesting an airdrop
const sig = await connection.requestAirdrop(
  payer.publicKey,
  2 * LAMPORTS_PER_SOL,
);

await connection.confirmTransaction(sig);
