import hashlib
import json
from time import time

class Blockchain(object):
    def _init_(self):
        self.chain = []
        self.current_transactions = []

        # genesis block 생성
        self.new_block(previous_hash=1, proof=100)

    def new_block(self, proof, previous_hash=None):
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

    def new_transaction(self, sender, recipient, amount):
        # add new transaction to list of transaction
        """
            Creates a new transaction to go into the next mined Block

            :param sender: <str> Sender의 주소
            :param recipient: <str> Recipient의 주소
            :param amount: <int> Amount
            :return: <int> 이 거래를 포함할 블록의 index 값
            """

        self.current_transactions.append({
            'sender': sender,
            'recipient': recipient,
            'amount': amount,
        })

        return self.last_block['index'] + 1

    @staticmethod
    def hash(block):
        # hashes a block
        pass

    @property
    def last_block(self):
        # return last block in chain
        pass