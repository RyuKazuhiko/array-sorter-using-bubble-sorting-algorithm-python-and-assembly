def bubbleSort(array):
    # loop to access each array element
    for i in range(len(array)):
        # loop to compare array elements
        for j in range(0, len(array) - i - 1):
            # compare two adjacent elements
            # change > to < to sort in descending order
            if array[j] > array[j + 1]:
                # swapping elements if elements
                # are not in the intended order
                temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp

# Get user input for array elements
input_array = input("Enter elements of the array separated by spaces: ")
# Convert input string to list of integers
data = list(map(int, input_array.split()))

# Call the bubbleSort function to sort the user input data
bubbleSort(data)

# Print the sorted array
print('Sorted Array in Ascending Order:')
print(data)