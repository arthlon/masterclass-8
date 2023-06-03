int findFibonacci(int position) {
  if(position == 0) return position;
  if(position == 1) return position;
  return findFibonacci(position - 1) + findFibonacci(position - 2);
}

List<int> listFibonacci(int position, List<int> list) {
  if(position == 0) return list;
  list[position - 1] = findFibonacci(position);
  return listFibonacci(position - 1, list);
}

void main(List<String> arguments) {
  int position = 15;
  List<int> listNumbers = listFibonacci(position, List.filled(position, 0));
  int fibonacci = listNumbers[position - 1];

  print(listNumbers);

  print("\n O número Fibonacci na posição $position é: $fibonacci");
}
