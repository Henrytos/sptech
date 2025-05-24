// base case -> is size 0 or 1 element
// recursive case -> as long as you have subdivision in the array

function sort(numbers) {
  if (numbers.length <= 1) return numbers;

  let minorNumbers = [];
  let majorNumbers = [];

  let positionMedium = Math.floor(numbers.length / 2);
  let comparisonNumber = numbers[positionMedium];

  for (let position = 0; position < numbers.length; position++) {
    let number = numbers[position];

    if (position == positionMedium) continue;

    if (number <= comparisonNumber) minorNumbers.push(number);
    else majorNumbers.push(number);
  }

  return [...sort(minorNumbers), comparisonNumber, ...sort(majorNumbers)];
}

const numbers = [4, 1, 2, 32, 3, 4, 5];
const numbersOrder = sort(numbers);

console.log({
  numbers,
  numbersOrder,
});
