import unittest
import task3


class MyTest(unittest.TestCase):
    def test_factorial(self):
        self.assertEqual(task3.factorial(1), 1)
        self.assertEqual(task3.factorial(3), 6)
        self.assertEqual(task3.factorial(5), 120)


if __name__ == '__main__':
    unittest.main()
