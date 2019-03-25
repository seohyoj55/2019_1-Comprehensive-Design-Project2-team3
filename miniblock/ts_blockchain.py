class Blockchain(object):
    def _init_(self):
        self.chain = []
        self.current_transactions = []

    def new_block(self):
        # create new block, add it to chain
        """
          블록체인에 새로운 블록 만들기

          :param proof: <int> proof 는 Proof of Work 알고리즘에 의해서 제공된다.
          :param previous_hash: (Optional) <str> 이전 블록의 해쉬값
          :return : <dict> 새로운 블록

          """

        block = {
            'index': len(self.chain) + 1,
            'timestamp': time(),
            'transactions': self.current_transactions,
            'proof': proof,
            'previous_hash': previous_hash or self.hash(self.chain[-1]),
        }

        # 거래 내역 초기화
        self.current_transactions = []

        self.chain.append(block)
        return block

    def new_transaction(self):
        # add new transaction to list of transaction
        pass

    @staticmethod
    def hash(block):
        # hashes a block
        pass

    @property
    def last_block(self):
        # return last block in chain
        pass