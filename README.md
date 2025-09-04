[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SPs4PNWX)
# Lab 1 : CEG 3400 Intro to Cyber Security

## Name:

### Task 1: Hashing

**Reminder Deliverable:** Is your `salted-data.csv` in this repository?

Answer the following in this file:

* How many unique users are in the data? 
  * 42
* How many salts did you create? 
  * 42
* How many possible combinations will I need to try to figure out the secret ID
  of all students (assume I know all potential secret IDs and have your 
  `salted-data.csv`) 
  * The salt is 5 digits long (a total of 100,000 salts), there are 42 unique users, the total combinations possible is 4,200,000.
* Instead of salts, if you were to use a nonce (unique number for each hashed
  field) how many possible combinations would I need to try? 
  * There are 1302 total lines excluding the header, there are a total of 100,000 salts, the total combinations possible is 130,200,000.
* Given the above, if this quiz data were *actual* class data, say for example
  your final exam, how would you store this dataset?  Why?
  * If I was storing this dataset, i would still salt the hashes but instead of the salts just having numbers, i would mix in letter or any other character. 
    Intead of there being 100,000 total salts, it would drastically increase the amount salts that the attacker would have to try.

```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 1 here

tail -n +2 data/quiz_data.csv
I was adding an if statement inside my for-loop to check if the line was the header, but instead I could remove it entirely.

```

---

### Task 2: Crypto Mining

**Reminder Deliverable:** Is your "mining" code in this repository (`mining/`)?
**Reminder Deliverable:** Is your nonce + word combos in `coins.txt`?

Answer the following:

* Paste your ***nonce+word(s) and hash(s)*** below ( either 3x `000` hashes or 1x `0000`
hash)

```
0463these
8542these
1792are
321909these
```

* How many words were in your dictionary? 
  * 14
* How many nonces did your code iterate over?
  * A total of 10,000 (0000 - 9999).
  * After trying to get a 5 leading zeros coin, it can do 1,000,000.
* What was the maximum number of hashes your code *could* compute given the above?
  * With 10,000 nonces and 14 possible words from the dictionary, a total of 140,000 possible hashes.
  * After trying to get a 5 leading zeros coin, a total of 14,000,000 possible hashes.
* What did you think about Task 2?
  * I enjoyed doing task 2 because there are many ways that this can performed, such as a bigger dictionary,
    making longer nonces, or have the nonces include letters. Another choice I had to make was either to start randomly 
    in the dictionary and to either generate a random nonce. I especially enjoyed the bonus challenge, trying to find
    other ways to improve efficiency, although not successful, i just increased the length and range of the nonce.
* Is there a better way than brute force to attempt to get higher valued coins?
* Why or why not?
    * Finding another method besides generating nonces and combining them with dictionary words, there is no shortcut to find more zeros in a hash, brute
      brute force is the only way. Checking all the possible hashes is the most efficient method. What can be improved is efficiency, making the code 
      more efficient or getting hardware that's capable of more.


```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 2 here

$hash_coin == ${required_zeros}*
I struggled to check if the hash started with the required amount of zero's, I had to find how to do it
https://java2blog.com/check-if-string-starts-with-another-string-bash/
```

