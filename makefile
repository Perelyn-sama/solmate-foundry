# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

install: 
	forge install Rari-Capital/solmate Openzeppelin/openzeppelin-contracts foundry-rs/forge-std

ver: 
	forge verify-contract --chain-id 4 --num-of-optimizations 200 --constructor-args 0x00000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000544454c4d410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003444d410000000000000000000000000000000000000000000000000000000000 --compiler-version v0.8.10+commit.fc410830 0x755d906c221f74170d2d81a95535fa2d470cdd5c src/NFT.sol:NFT 81QCGJFBDH6YVV77JAQC2N35GZ6BX7HBCA

ck: 
	forge verify-check --chain-id 42 qksqxxsb6ndun5315hgxagegamkm1wlc2ym7zgyqmpexdukrdn 81QCGJFBDH6YVV77JAQC2N35GZ6BX7HBCA

mint: 
	cast send --rpc-url=$RPC_URL 0x755d906c221f74170d2d81a95535fa2d470cdd5c "mintTo(address)" 0x68df7639ef63fA25D618cdEEBbdd1093d37c8e18 --private-key=$PRIVATE_KEY

currentTokenId:
	cast call --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY 0x755d906c221f74170d2d81a95535fa2d470cdd5c "ownerOf(uint256)(address)" 1

gas:
	forge test --gas-report

test: 
	forge test
