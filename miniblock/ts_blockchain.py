class Blockchain(object):
    def _init_(self):
        self.chain = []
        self.current_transactions = []

    def new_block(self):
        # create new block, add it to chain
        pass

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