module Main where

main = do
    contents <- readFile ("day1-input.txt")
    let list = map read . lines $ contents
    print (part1 list)
    print (part2 list)

part1 list = product (head matches)
    where
        combos = combinationsOf 2 list
        matches = filter sumsTo2020 combos

part2 list = product (head matches)
    where
        combos = combinationsOf 3 list
        matches = filter sumsTo2020 combos

sumsTo2020 :: [Int] -> Bool
sumsTo2020 x = sum x == 2020

-- From https://stackoverflow.com/a/59695480
combinationsOf :: Int -> [a] -> [[a]]
combinationsOf k xs = runner n k xs
                      where
                      n = length xs
                      runner :: Int -> Int -> [a] -> [[a]]
                      runner n' k' xs'@(y:ys) = if k' < n'      -- k' < length of the list
                                                then if k' == 1
                                                     then map pure xs'
                                                     else map (y:) (runner (n'-1) (k'-1) ys) ++ runner (n'-1) k' ys
                                                else pure xs'   -- k' == length of the list.
