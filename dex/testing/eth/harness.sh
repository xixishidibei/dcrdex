#!/usr/bin/env bash
# tmux script that sets up an eth simnet harness. There is only one node in
# --dev mode.
set -ex

SESSION="eth-harness"

ALPHA_AUTHRPC_PORT="8552"
ALPHA_HTTP_PORT="38556"
ALPHA_WS_PORT="38557"
ALPHA_WS_MODULES="eth"

# TESTING_ADDRESS is used by the client's internal node.
TESTING_ADDRESS="946dfaB1AD7caCFeF77dE70ea68819a30acD4577"
ETH_SWAP_V0="608060405234801561001057600080fd5b50610b7a806100206000396000f3fe6080604052600436106100555760003560e01c80637249fbb61461005a57806376467cbd1461007c578063a8793f94146100b2578063d0f761c0146100c5578063eb84e7f2146100f5578063f4fd17f914610171575b600080fd5b34801561006657600080fd5b5061007a610075366004610871565b610191565b005b34801561008857600080fd5b5061009c610097366004610871565b6102c9565b6040516100a991906108c2565b60405180910390f35b61007a6100c0366004610927565b6103a4565b3480156100d157600080fd5b506100e56100e0366004610871565b61059b565b60405190151581526020016100a9565b34801561010157600080fd5b5061015e610110366004610871565b60006020819052908152604090208054600182015460028301546003840154600485015460059095015493949293919290916001600160a01b0391821691811690600160a01b900460ff1687565b6040516100a9979695949392919061099c565b34801561017d57600080fd5b5061007a61018c3660046109e8565b6105e3565b3233146101b95760405162461bcd60e51b81526004016101b090610a4b565b60405180910390fd5b6101c28161059b565b6101ff5760405162461bcd60e51b815260206004820152600e60248201526d6e6f7420726566756e6461626c6560901b60448201526064016101b0565b60008181526020819052604080822060058101805460ff60a01b1916600360a01b1790556004810154600182015492519193926001600160a01b03909116918381818185875af1925050503d8060008114610276576040519150601f19603f3d011682016040523d82523d6000602084013e61027b565b606091505b50909150506001811515146102c45760405162461bcd60e51b815260206004820152600f60248201526e1d1c985b9cd9995c8819985a5b1959608a1b60448201526064016101b0565b505050565b6103066040805160e081018252600080825260208201819052918101829052606081018290526080810182905260a081018290529060c082015290565b60008281526020818152604091829020825160e08101845281548152600182015492810192909252600281015492820192909252600380830154606083015260048301546001600160a01b039081166080840152600584015490811660a084015291929160c0840191600160a01b90910460ff169081111561038a5761038a61088a565b600381111561039b5761039b61088a565b90525092915050565b3233146103c35760405162461bcd60e51b81526004016101b090610a4b565b6000805b8281101561056157368484838181106103e2576103e2610a75565b9050608002019050600080600083602001358152602001908152602001600020905060008260600135116104405760405162461bcd60e51b81526020600482015260056024820152640c081d985b60da1b60448201526064016101b0565b81356104825760405162461bcd60e51b815260206004820152601160248201527003020726566756e6454696d657374616d7607c1b60448201526064016101b0565b60006005820154600160a01b900460ff1660038111156104a4576104a461088a565b146104dc5760405162461bcd60e51b8152602060048201526008602482015267064757020737761760c41b60448201526064016101b0565b436002820155813560038201556004810180546001600160a01b0319163317905561050d6060830160408401610a8b565b6005820180546060850135600185018190556001600160a01b03939093166001600160a81b031990911617600160a01b17905561054a9085610aca565b93505050808061055990610ae3565b9150506103c7565b503481146102c45760405162461bcd60e51b8152602060048201526007602482015266189859081d985b60ca1b60448201526064016101b0565b600081815260208190526040812060016005820154600160a01b900460ff1660038111156105cb576105cb61088a565b1480156105dc575080600301544210155b9392505050565b3233146106025760405162461bcd60e51b81526004016101b090610a4b565b6000805b828110156107da573684848381811061062157610621610a75565b6020604091820293909301838101356000908152938490529220919250600190506005820154600160a01b900460ff1660038111156106625761066261088a565b1461069b5760405162461bcd60e51b815260206004820152600960248201526862616420737461746560b81b60448201526064016101b0565b60058101546001600160a01b031633146106e95760405162461bcd60e51b815260206004820152600f60248201526e189859081c185c9d1a58da5c185b9d608a1b60448201526064016101b0565b81602001356002836000013560405160200161070791815260200190565b60408051601f198184030181529082905261072191610afc565b602060405180830381855afa15801561073e573d6000803e3d6000fd5b5050506040513d601f19601f820116820180604052508101906107619190610b2b565b1461079b5760405162461bcd60e51b815260206004820152600a602482015269189859081cd958dc995d60b21b60448201526064016101b0565b60058101805460ff60a01b1916600160a11b1790558135815560018101546107c39085610aca565b9350505080806107d290610ae3565b915050610606565b50604051600090339083908381818185875af1925050503d806000811461081d576040519150601f19603f3d011682016040523d82523d6000602084013e610822565b606091505b509091505060018115151461086b5760405162461bcd60e51b815260206004820152600f60248201526e1d1c985b9cd9995c8819985a5b1959608a1b60448201526064016101b0565b50505050565b60006020828403121561088357600080fd5b5035919050565b634e487b7160e01b600052602160045260246000fd5b600481106108be57634e487b7160e01b600052602160045260246000fd5b9052565b600060e08201905082518252602083015160208301526040830151604083015260608301516060830152608083015160018060a01b0380821660808501528060a08601511660a0850152505060c083015161092060c08401826108a0565b5092915050565b6000806020838503121561093a57600080fd5b823567ffffffffffffffff8082111561095257600080fd5b818501915085601f83011261096657600080fd5b81358181111561097557600080fd5b8660208260071b850101111561098a57600080fd5b60209290920196919550909350505050565b8781526020810187905260408101869052606081018590526001600160a01b038481166080830152831660a082015260e081016109dc60c08301846108a0565b98975050505050505050565b600080602083850312156109fb57600080fd5b823567ffffffffffffffff80821115610a1357600080fd5b818501915085601f830112610a2757600080fd5b813581811115610a3657600080fd5b8660208260061b850101111561098a57600080fd5b60208082526010908201526f39b2b73232b910109e9037b934b3b4b760811b604082015260600190565b634e487b7160e01b600052603260045260246000fd5b600060208284031215610a9d57600080fd5b81356001600160a01b03811681146105dc57600080fd5b634e487b7160e01b600052601160045260246000fd5b80820180821115610add57610add610ab4565b92915050565b600060018201610af557610af5610ab4565b5060010190565b6000825160005b81811015610b1d5760208186018101518583015201610b03565b506000920191825250919050565b600060208284031215610b3d57600080fd5b505191905056fea2646970667358221220d288c9a18362adf67607179f5c8585d0abe014bdb904b6e878451ac0c393a04364736f6c63430008120033"
ERC20_SWAP_V0="60a060405234801561001057600080fd5b50604051610e92380380610e9283398101604081905261002f91610040565b6001600160a01b0316608052610070565b60006020828403121561005257600080fd5b81516001600160a01b038116811461006957600080fd5b9392505050565b608051610df361009f6000396000818160c50152818161029b0152818161066b01526109f30152610df36000f3fe608060405234801561001057600080fd5b506004361061007d5760003560e01c8063a8793f941161005b578063a8793f94146100ff578063d0f761c014610112578063eb84e7f214610135578063f4fd17f9146101a457600080fd5b80637249fbb61461008257806376467cbd146100975780638c8e8fee146100c0575b600080fd5b610095610090366004610ac8565b6101b7565b005b6100aa6100a5366004610ac8565b610376565b6040516100b79190610b19565b60405180910390f35b6100e77f000000000000000000000000000000000000000000000000000000000000000081565b6040516001600160a01b0390911681526020016100b7565b61009561010d366004610b7e565b610451565b610125610120366004610ac8565b61074c565b60405190151581526020016100b7565b610191610143366004610ac8565b60006020819052908152604090208054600182015460028301546003840154600485015460059095015493949293919290916001600160a01b0391821691811690600160a01b900460ff1687565b6040516100b79796959493929190610bf3565b6100956101b2366004610c3f565b6107ac565b3233146101df5760405162461bcd60e51b81526004016101d690610ca2565b60405180910390fd5b6101e88161074c565b6102255760405162461bcd60e51b815260206004820152600e60248201526d6e6f7420726566756e6461626c6560901b60448201526064016101d6565b60008181526020818152604080832060058101805460ff60a01b1916600360a01b17905560018101548251336024820152604480820192909252835180820390920182526064018352928301805163a9059cbb60e01b6001600160e01b0390911617905290519092916060916001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016916102c591610ccc565b6000604051808303816000865af19150503d8060008114610302576040519150601f19603f3d011682016040523d82523d6000602084013e610307565b606091505b5090925090508180156103325750805115806103325750808060200190518101906103329190610cfb565b6103705760405162461bcd60e51b815260206004820152600f60248201526e1d1c985b9cd9995c8819985a5b1959608a1b60448201526064016101d6565b50505050565b6103b36040805160e081018252600080825260208201819052918101829052606081018290526080810182905260a081018290529060c082015290565b60008281526020818152604091829020825160e08101845281548152600182015492810192909252600281015492820192909252600380830154606083015260048301546001600160a01b039081166080840152600584015490811660a084015291929160c0840191600160a01b90910460ff169081111561043757610437610ae1565b600381111561044857610448610ae1565b90525092915050565b3233146104705760405162461bcd60e51b81526004016101d690610ca2565b6000805b82811015610615573684848381811061048f5761048f610d1d565b9050608002019050600080600083602001358152602001908152602001600020905060008260600135116104ed5760405162461bcd60e51b81526020600482015260056024820152640c081d985b60da1b60448201526064016101d6565b813561052f5760405162461bcd60e51b815260206004820152601160248201527003020726566756e6454696d657374616d7607c1b60448201526064016101d6565b60006005820154600160a01b900460ff16600381111561055157610551610ae1565b146105905760405162461bcd60e51b815260206004820152600f60248201526e0c8eae040e6cac6e4cae840d0c2e6d608b1b60448201526064016101d6565b436002820155813560038201556004810180546001600160a01b031916331790556105c16060830160408401610d33565b6005820180546060850135600185018190556001600160a01b03939093166001600160a81b031990911617600160a01b1790556105fe9085610d72565b93505050808061060d90610d8b565b915050610474565b5060408051336024820152306044820152606480820184905282518083039091018152608490910182526020810180516001600160e01b03166323b872dd60e01b17905290516000916060916001600160a01b037f0000000000000000000000000000000000000000000000000000000000000000169161069591610ccc565b6000604051808303816000865af19150503d80600081146106d2576040519150601f19603f3d011682016040523d82523d6000602084013e6106d7565b606091505b5090925090508180156107025750805115806107025750808060200190518101906107029190610cfb565b6107455760405162461bcd60e51b81526020600482015260146024820152731d1c985b9cd9995c88199c9bdb4819985a5b195960621b60448201526064016101d6565b5050505050565b600081815260208190526040812060016005820154600160a01b900460ff16600381111561077c5761077c610ae1565b148015610795575060048101546001600160a01b031633145b80156107a5575080600301544210155b9392505050565b3233146107cb5760405162461bcd60e51b81526004016101d690610ca2565b6000805b828110156109a357368484838181106107ea576107ea610d1d565b6020604091820293909301838101356000908152938490529220919250600190506005820154600160a01b900460ff16600381111561082b5761082b610ae1565b146108645760405162461bcd60e51b815260206004820152600960248201526862616420737461746560b81b60448201526064016101d6565b60058101546001600160a01b031633146108b25760405162461bcd60e51b815260206004820152600f60248201526e189859081c185c9d1a58da5c185b9d608a1b60448201526064016101d6565b8160200135600283600001356040516020016108d091815260200190565b60408051601f19818403018152908290526108ea91610ccc565b602060405180830381855afa158015610907573d6000803e3d6000fd5b5050506040513d601f19601f8201168201806040525081019061092a9190610da4565b146109645760405162461bcd60e51b815260206004820152600a602482015269189859081cd958dc995d60b21b60448201526064016101d6565b60058101805460ff60a01b1916600160a11b17905581358155600181015461098c9085610d72565b93505050808061099b90610d8b565b9150506107cf565b5060408051336024820152604480820184905282518083039091018152606490910182526020810180516001600160e01b031663a9059cbb60e01b17905290516000916060916001600160a01b037f00000000000000000000000000000000000000000000000000000000000000001691610a1d91610ccc565b6000604051808303816000865af19150503d8060008114610a5a576040519150601f19603f3d011682016040523d82523d6000602084013e610a5f565b606091505b509092509050818015610a8a575080511580610a8a575080806020019051810190610a8a9190610cfb565b6107455760405162461bcd60e51b815260206004820152600f60248201526e1d1c985b9cd9995c8819985a5b1959608a1b60448201526064016101d6565b600060208284031215610ada57600080fd5b5035919050565b634e487b7160e01b600052602160045260246000fd5b60048110610b1557634e487b7160e01b600052602160045260246000fd5b9052565b600060e08201905082518252602083015160208301526040830151604083015260608301516060830152608083015160018060a01b0380821660808501528060a08601511660a0850152505060c0830151610b7760c0840182610af7565b5092915050565b60008060208385031215610b9157600080fd5b823567ffffffffffffffff80821115610ba957600080fd5b818501915085601f830112610bbd57600080fd5b813581811115610bcc57600080fd5b8660208260071b8501011115610be157600080fd5b60209290920196919550909350505050565b8781526020810187905260408101869052606081018590526001600160a01b038481166080830152831660a082015260e08101610c3360c0830184610af7565b98975050505050505050565b60008060208385031215610c5257600080fd5b823567ffffffffffffffff80821115610c6a57600080fd5b818501915085601f830112610c7e57600080fd5b813581811115610c8d57600080fd5b8660208260061b8501011115610be157600080fd5b60208082526010908201526f39b2b73232b910109e9037b934b3b4b760811b604082015260600190565b6000825160005b81811015610ced5760208186018101518583015201610cd3565b506000920191825250919050565b600060208284031215610d0d57600080fd5b815180151581146107a557600080fd5b634e487b7160e01b600052603260045260246000fd5b600060208284031215610d4557600080fd5b81356001600160a01b03811681146107a557600080fd5b634e487b7160e01b600052601160045260246000fd5b80820180821115610d8557610d85610d5c565b92915050565b600060018201610d9d57610d9d610d5c565b5060010190565b600060208284031215610db657600080fd5b505191905056fea2646970667358221220a055a4890a5ecf3876dbee91dfbeb46ba11b5f7c09b6d935173932d93f8fb92264736f6c63430008120033"
TEST_TOKEN="608060405234801561001057600080fd5b50604051610aec380380610aec83398101604081905261002f91610140565b6040805180820190915260098152682a32b9ba2a37b5b2b760b91b602082015260039061005c9082610209565b506040805180820190915260038152621514d560ea1b60208201526004906100849082610209565b506005805460ff191660ff929092169190911790556909513ea9de0243800000600255600060208190526902544faa778090e000007f7d4921c2bc32c0110a31d16f4efb43c7a1228f1df7af765f608241dee5c62ebc8190557f59603491850c7d11499afe95b334ccfd92b48b36a15df31ef59ff5813fe3708281905573d12ab7cf72ccf1f3882ec99ddc53cd415635c3be9091527f5bd8dfce2dbb581d0922a094c40bab2f7d2f0ea9aaf275bf0fcc0f027a2ff91d556102c8565b60006020828403121561015257600080fd5b815160ff8116811461016357600080fd5b9392505050565b634e487b7160e01b600052604160045260246000fd5b600181811c9082168061019457607f821691505b6020821081036101b457634e487b7160e01b600052602260045260246000fd5b50919050565b601f82111561020457600081815260208120601f850160051c810160208610156101e15750805b601f850160051c820191505b81811015610200578281556001016101ed565b5050505b505050565b81516001600160401b038111156102225761022261016a565b610236816102308454610180565b846101ba565b602080601f83116001811461026b57600084156102535750858301515b600019600386901b1c1916600185901b178555610200565b600085815260208120601f198616915b8281101561029a5788860151825594840194600190910190840161027b565b50858210156102b85787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b610815806102d76000396000f3fe608060405234801561001057600080fd5b50600436106100a95760003560e01c806370a082311161007157806370a08231146101295780638ba4cc3c1461015257806395d89b4114610167578063a9059cbb1461016f578063ce714b5114610182578063dd62ed3e1461019557600080fd5b806306fdde03146100ae578063095ea7b3146100cc57806318160ddd146100ef57806323b872dd14610101578063313ce56714610114575b600080fd5b6100b66101ce565b6040516100c3919061065f565b60405180910390f35b6100df6100da3660046106c9565b610260565b60405190151581526020016100c3565b6002545b6040519081526020016100c3565b6100df61010f3660046106f3565b610277565b60055460405160ff90911681526020016100c3565b6100f361013736600461072f565b6001600160a01b031660009081526020819052604090205490565b6101656101603660046106c9565b610326565b005b6100b661036e565b6100df61017d3660046106c9565b61037d565b6100df6101903660046106f3565b61038a565b6100f36101a3366004610751565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b6060600380546101dd90610784565b80601f016020809104026020016040519081016040528092919081815260200182805461020990610784565b80156102565780601f1061022b57610100808354040283529160200191610256565b820191906000526020600020905b81548152906001019060200180831161023957829003601f168201915b5050505050905090565b600061026d3384846103a1565b5060015b92915050565b6000610284848484610490565b6001600160a01b03841660009081526001602090815260408083203384529091529020548281101561030e5760405162461bcd60e51b815260206004820152602860248201527f45524332303a207472616e7366657220616d6f756e74206578636565647320616044820152676c6c6f77616e636560c01b60648201526084015b60405180910390fd5b61031b85338584036103a1565b506001949350505050565b806002600082825461033891906107be565b90915550506001600160a01b038216600090815260208190526040812080548392906103659084906107be565b90915550505050565b6060600480546101dd90610784565b600061026d338484610490565b60006103978484846103a1565b5060019392505050565b6001600160a01b0383166104035760405162461bcd60e51b8152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f206164646044820152637265737360e01b6064820152608401610305565b6001600160a01b0382166104645760405162461bcd60e51b815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f206164647265604482015261737360f01b6064820152608401610305565b6001600160a01b0392831660009081526001602090815260408083209490951682529290925291902055565b6001600160a01b0383166104f45760405162461bcd60e51b815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f206164604482015264647265737360d81b6064820152608401610305565b6001600160a01b0382166105565760405162461bcd60e51b815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201526265737360e81b6064820152608401610305565b6001600160a01b038316600090815260208190526040902054818110156105ce5760405162461bcd60e51b815260206004820152602660248201527f45524332303a207472616e7366657220616d6f756e7420657863656564732062604482015265616c616e636560d01b6064820152608401610305565b6001600160a01b038085166000908152602081905260408082208585039055918516815290812080548492906106059084906107be565b92505081905550826001600160a01b0316846001600160a01b03167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef8460405161065191815260200190565b60405180910390a350505050565b600060208083528351808285015260005b8181101561068c57858101830151858201604001528201610670565b506000604082860101526040601f19601f8301168501019250505092915050565b80356001600160a01b03811681146106c457600080fd5b919050565b600080604083850312156106dc57600080fd5b6106e5836106ad565b946020939093013593505050565b60008060006060848603121561070857600080fd5b610711846106ad565b925061071f602085016106ad565b9150604084013590509250925092565b60006020828403121561074157600080fd5b61074a826106ad565b9392505050565b6000806040838503121561076457600080fd5b61076d836106ad565b915061077b602084016106ad565b90509250929050565b600181811c9082168061079857607f821691505b6020821081036107b857634e487b7160e01b600052602260045260246000fd5b50919050565b8082018082111561027157634e487b7160e01b600052601160045260246000fdfea2646970667358221220a1dec430e536a5a10a28fc4b864936f9d148be4c0a5db1246a0865556ca3bdde64736f6c63430008120033"
MULTIBALANCE_BIN="608060405234801561001057600080fd5b50610483806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c8063d3e5ca8714610030575b600080fd5b61004361003e3660046102a5565b610059565b604051610050919061032b565b60405180910390f35b60606000610068836001610385565b67ffffffffffffffff8111156100805761008061039e565b6040519080825280602002602001820160405280156100a9578160200160208202803683370190505b509050846001600160a01b031631816000815181106100ca576100ca6103b4565b60200260200101818152505060005b838110156102805760008585838181106100f5576100f56103b4565b905060200201602081019061010a91906103ca565b905060006060826001600160a01b03167f70a08231b98ef4ca268c9cc3f6b4590e4bfec28280db06bb5d45e689f2a360be8a60405160240161015b91906001600160a01b0391909116815260200190565b60408051601f198184030181529181526020820180516001600160e01b03166001600160e01b031990941693909317909252905161019991906103ec565b600060405180830381855afa9150503d80600081146101d4576040519150601f19603f3d011682016040523d82523d6000602084013e6101d9565b606091505b509092509050816102285760405162461bcd60e51b815260206004820152601560248201527418985b185b98d953d98818d85b1b0819985a5b1959605a1b604482015260640160405180910390fd5b60008180602001905181019061023e919061041b565b9050808661024d876001610385565b8151811061025d5761025d6103b4565b60200260200101818152505050505050808061027890610434565b9150506100d9565b50949350505050565b80356001600160a01b03811681146102a057600080fd5b919050565b6000806000604084860312156102ba57600080fd5b6102c384610289565b9250602084013567ffffffffffffffff808211156102e057600080fd5b818601915086601f8301126102f457600080fd5b81358181111561030357600080fd5b8760208260051b850101111561031857600080fd5b6020830194508093505050509250925092565b6020808252825182820181905260009190848201906040850190845b8181101561036357835183529284019291840191600101610347565b50909695505050505050565b634e487b7160e01b600052601160045260246000fd5b808201808211156103985761039861036f565b92915050565b634e487b7160e01b600052604160045260246000fd5b634e487b7160e01b600052603260045260246000fd5b6000602082840312156103dc57600080fd5b6103e582610289565b9392505050565b6000825160005b8181101561040d57602081860181015185830152016103f3565b506000920191825250919050565b60006020828403121561042d57600080fd5b5051919050565b6000600182016104465761044661036f565b506001019056fea26469706673582212207074e3e189a2692e2841f7943a9de24bcdbca943ee6bfcbd83a2fa6e43ec497b64736f6c63430008120033"

export NODES_ROOT=~/dextest/eth

if [ -d "${NODES_ROOT}" ]; then
  rm -R "${NODES_ROOT}"
fi

mkdir -p "${NODES_ROOT}/alpha"
mkdir -p "${NODES_ROOT}/harness-ctl"

echo "Writing ctl scripts"
################################################################################
# Control Scripts
################################################################################

cat > "${NODES_ROOT}/harness-ctl/send.js" <<EOF
function send(to, value) {
  to = to.startsWith('0x') ? to : '0x' + to
  return eth.sendTransaction({from:eth.accounts[0], to, value})
}
EOF

cat > "${NODES_ROOT}/harness-ctl/sendtoaddress" <<EOF
#!/usr/bin/env bash
"${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/send.js --exec send(\"\$1\",\$2*1e18)"
EOF
chmod +x "${NODES_ROOT}/harness-ctl/sendtoaddress"

cat > "${NODES_ROOT}/harness-ctl/deploy.js" <<EOF
function deploy(contract) {
  tx = eth.sendTransaction({from:eth.accounts[0],data:"0x"+contract})
  return tx;
}

function deployERC20(contract, decimals) {
  const hexDecimals = decimals.toString(16);
  const data = "0x" + contract + hexDecimals.padStart(64, "0");
  tx = eth.sendTransaction({from:eth.accounts[0],data:data})
  return tx;
}

function deployERC20Swap(contract, tokenAddr) {
  if (tokenAddr.slice(0, 2) === "0x") {
    tokenAddr = tokenAddr.slice(2)
  }
  var paddedAddr = tokenAddr.padStart(64, "0")
  tx = eth.sendTransaction({from:eth.accounts[0],data:"0x"+contract+paddedAddr})
  return tx;
}
EOF

cat > "${NODES_ROOT}/harness-ctl/contractAddress.js" <<EOF
function contractAddress(tx) {
  addr = eth.getTransactionReceipt(tx).contractAddress
  return addr;
}
EOF

# Add node script.
HARNESS_DIR=$(dirname "$0")
cp "${HARNESS_DIR}/create-node.sh" "${NODES_ROOT}/harness-ctl/create-node"

# Shutdown script
cat > "${NODES_ROOT}/harness-ctl/quit" <<EOF
#!/usr/bin/env bash
tmux send-keys -t $SESSION:5 C-c
tmux send-keys -t $SESSION:1 C-c
tmux kill-session
EOF
chmod +x "${NODES_ROOT}/harness-ctl/quit"

################################################################################
# Start harness
################################################################################

echo "Starting harness"
tmux new-session -d -s $SESSION "${SHELL}"
tmux rename-window -t $SESSION:0 'harness-ctl'
tmux send-keys -t $SESSION:0 "set +o history" C-m
tmux send-keys -t $SESSION:0 "cd ${NODES_ROOT}/harness-ctl" C-m

################################################################################
# Eth nodes
################################################################################

echo "Starting simnet alpha node"
"${HARNESS_DIR}/create-node.sh" "$SESSION:1" "alpha" \
	"$ALPHA_AUTHRPC_PORT" "$ALPHA_HTTP_PORT" "$ALPHA_WS_PORT" \
	"$ALPHA_WS_MODULES"

sleep 10

SEND_AMT=5000000000000000000000
echo "Sending 5000 eth to testing."
TEST_TX_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/send.js --exec send(\"${TESTING_ADDRESS}\",${SEND_AMT})" | sed 's/"//g')
echo "ETH transaction to use in tests is ${TEST_TX_HASH}. Saving to ${NODES_ROOT}/test_tx_hash.txt"
cat > "${NODES_ROOT}/test_tx_hash.txt" <<EOF
${TEST_TX_HASH}
EOF

echo "Deploying ETHSwapV0 contract."
ETH_SWAP_CONTRACT_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/deploy.js --exec deploy(\"${ETH_SWAP_V0}\")" | sed 's/"//g')

echo "Deploying USDC contract."
TEST_USDC_CONTRACT_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/deploy.js --exec deployERC20(\"${TEST_TOKEN}\",6)" | sed 's/"//g')

echo "Deploying USDT contract."
TEST_USDT_CONTRACT_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/deploy.js --exec deployERC20(\"${TEST_TOKEN}\",6)" | sed 's/"//g')

echo "Deploying MultiBalance contract."
MULTIBALANCE_CONTRACT_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/deploy.js --exec deploy(\"${MULTIBALANCE_BIN}\")" | sed 's/"//g')

mine_pending_txs() {
  while true
  do
    TXSLEN=$("${NODES_ROOT}/harness-ctl/alpha" "attach --exec eth.pendingTransactions.length")
    if [ "$TXSLEN" -eq 0 ]; then
      break
    fi
    echo "Waiting for transactions to be mined."
    sleep 2
  done
}

mine_pending_txs

ETH_SWAP_CONTRACT_ADDR=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/contractAddress.js --exec contractAddress(\"${ETH_SWAP_CONTRACT_HASH}\")" | sed 's/"//g')
echo "ETH SWAP contract address is ${ETH_SWAP_CONTRACT_ADDR}. Saving to ${NODES_ROOT}/eth_swap_contract_address.txt"
cat > "${NODES_ROOT}/eth_swap_contract_address.txt" <<EOF
${ETH_SWAP_CONTRACT_ADDR}
EOF

TEST_USDC_CONTRACT_ADDR=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/contractAddress.js --exec contractAddress(\"${TEST_USDC_CONTRACT_HASH}\")" | sed 's/"//g')
echo "Test USDC contract address is ${TEST_USDC_CONTRACT_ADDR}. Saving to ${NODES_ROOT}/test_usdc_contract_address.txt"
cat > "${NODES_ROOT}/test_usdc_contract_address.txt" <<EOF
${TEST_USDC_CONTRACT_ADDR}
EOF

echo "Deploying ERC20SwapV0 contract for USDC."
USDC_SWAP_CONTRACT_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/deploy.js --exec deployERC20Swap(\"${ERC20_SWAP_V0}\",\"${TEST_USDC_CONTRACT_ADDR}\")" | sed 's/"//g')

TEST_USDT_CONTRACT_ADDR=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/contractAddress.js --exec contractAddress(\"${TEST_USDT_CONTRACT_HASH}\")" | sed 's/"//g')
echo "Test USDT contract address is ${TEST_USDT_CONTRACT_ADDR}. Saving to ${NODES_ROOT}/test_usdt_contract_address.txt"
cat > "${NODES_ROOT}/test_usdt_contract_address.txt" <<EOF
${TEST_USDT_CONTRACT_ADDR}
EOF

echo "Deploying ERC20SwapV0 contract for USDT."
USDT_SWAP_CONTRACT_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/deploy.js --exec deployERC20Swap(\"${ERC20_SWAP_V0}\",\"${TEST_USDT_CONTRACT_ADDR}\")" | sed 's/"//g')

cat > "${NODES_ROOT}/harness-ctl/loadTestToken.js" <<EOF
    // This ABI comes from running 'solc --abi TestToken.sol'
    const testTokenABI = [{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"airdrop","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"spender","type":"address"}],"name":"allowance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"approve","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"account","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"decimals","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"user","type":"address"},{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"testApprove","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"transfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"sender","type":"address"},{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"transferFrom","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"}]
    var contract = web3.eth.contract(testTokenABI)
    web3.eth.defaultAccount = web3.eth.accounts[0]

    function transfer (tokenAddr, decimals, addr, val) {
      addr = addr.startsWith('0x') ? addr : '0x'+addr
      var testToken = contract.at(tokenAddr)
      return testToken.transfer(addr, val*(10**decimals))
    }

    function airdrop (tokenAddr, amt) {
      var testToken = contract.at(tokenAddr)
      return testToken.airdrop(web3.eth.accounts[0], amt)
    }
EOF


cat > "${NODES_ROOT}/harness-ctl/alphaWithToken.sh" <<EOF
  # The testToken variable will provide access to the deployed test token contract.
  ./alpha --preload loadTestToken.js
EOF
chmod +x "${NODES_ROOT}/harness-ctl/alphaWithToken.sh"

cat > "${NODES_ROOT}/harness-ctl/sendUSDC" <<EOF
#!/usr/bin/env bash
./alpha attach --preload loadTestToken.js --exec "transfer(\"${TEST_USDC_CONTRACT_ADDR}\",6,\"\$1\",\$2)"
EOF
chmod +x "${NODES_ROOT}/harness-ctl/sendUSDC"

cat > "${NODES_ROOT}/harness-ctl/sendUSDT" <<EOF
#!/usr/bin/env bash
./alpha attach --preload loadTestToken.js --exec "transfer(\"${TEST_USDT_CONTRACT_ADDR}\",6,\"\$1\",\$2)"
EOF
chmod +x "${NODES_ROOT}/harness-ctl/sendUSDT"

mine_pending_txs

USDC_SWAP_CONTRACT_ADDR=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/contractAddress.js --exec contractAddress(\"${USDC_SWAP_CONTRACT_HASH}\")" | sed 's/"//g')
echo "ERC20 SWAP contract address is ${USDC_SWAP_CONTRACT_ADDR}. Saving to ${NODES_ROOT}/usdc_swap_contract_address.txt"
cat > "${NODES_ROOT}/usdc_swap_contract_address.txt" <<EOF
${USDC_SWAP_CONTRACT_ADDR}
EOF

USDT_SWAP_CONTRACT_ADDR=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/contractAddress.js --exec contractAddress(\"${USDT_SWAP_CONTRACT_HASH}\")" | sed 's/"//g')
echo "ERC20 SWAP contract address is ${USDT_SWAP_CONTRACT_ADDR}. Saving to ${NODES_ROOT}/usdt_swap_contract_address.txt"
cat > "${NODES_ROOT}/usdt_swap_contract_address.txt" <<EOF
${USDT_SWAP_CONTRACT_ADDR}
EOF

MULTIBALANCE_CONTRACT_ADDR=$("${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/contractAddress.js --exec contractAddress(\"${MULTIBALANCE_CONTRACT_HASH}\")" | sed 's/"//g')
echo "MultiBalance contract address is ${MULTIBALANCE_CONTRACT_ADDR}. Saving to ${NODES_ROOT}/multibalance_address.txt"
cat > "${NODES_ROOT}/multibalance_address.txt" <<EOF
${MULTIBALANCE_CONTRACT_ADDR}
EOF

# Add test tokens.
"${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/loadTestToken.js --exec airdrop(\"${TEST_USDC_CONTRACT_ADDR}\",4400000000000000000)"
"${NODES_ROOT}/harness-ctl/alpha" "attach --preload ${NODES_ROOT}/harness-ctl/loadTestToken.js --exec airdrop(\"${TEST_USDT_CONTRACT_ADDR}\",4400000000000000000)"

cd "${NODES_ROOT}/harness-ctl"

TEST_BLOCK1_HASH=$("${NODES_ROOT}/harness-ctl/alpha" "attach --exec eth.getHeaderByNumber(1).hash" | sed 's/"//g')
echo "ETH block 1 hash to use in tests is ${TEST_BLOCK1_HASH}. Saving to ${NODES_ROOT}/test_block1_hash.txt"
cat > "${NODES_ROOT}/test_block1_hash.txt" <<EOF
${TEST_BLOCK1_HASH}
EOF

# Miner
tmux new-window -t $SESSION:5 -n "miner" $SHELL
tmux send-keys -t $SESSION:5 "cd ${NODES_ROOT}/harness-ctl" C-m
tmux send-keys -t $SESSION:5 "watch -n 15 ./mine-alpha 1" C-m

# Reenable history and attach to the control session.
tmux select-window -t $SESSION:0
tmux send-keys -t $SESSION:0 "set -o history" C-m
tmux attach-session -t $SESSION
