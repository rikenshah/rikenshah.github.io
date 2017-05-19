---
layout: post
title: Code Monk Notes
excerpt: "Tutorials from Code Monk for Competitive Programming"
categories: articles
tags: [cpp, python, algorithms, data_structures]
author: riken_shah
comments: true
share: true
modified: 2017-05-19T14:18:57-04:00
published: true
---

## Basics

#### Algorithms based on bitwise operations

- Checking whether a given number is a power of 2 - If x is a power of 2, then x & (x-1) = 0. Complexity : O(1)

```c
bool isPowerOfTwo(int x)
{
    // x will check if x == 0 and !(x & (x - 1)) will check if x is a power of 2 or not
    return (x && !(x & (x - 1)));
}
```

- Checking number of ones in a binary representation of a number. Complexity : O(k) where k is number of ones in a binary representation of a number.

```c
int count_one (int n) 
{
    while( n )
    {
      n = n&(n-1);
      count++;
    }
    return count;
}
```

-  Left-shifting a number by k times multiples it by 2k. And right-shifting divides it.

- Check if the ith bit is set in the binary form of the given number. And the number with 2^i and if non-zero then bit is set.

```c
bool check (int N)
{
    if( N & (1 << i) )
        return true;
    else
        return false;
}
```

- Generating all possible subsets of a set. Logic is to represent a presence of a number by 1 and absence by 0.

```c
void possibleSubsets(char A[], int N)
{
    for(int i = 0;i < (1 << N); ++i)
    {
        for(int j = 0;j < N;++j)
            if(i & (1 << j))
                cout << A[j] << ‘ ‘;
        cout << endl;
   }
}
```

- To find the largest power of 2 (most significant bit  in binary form), which is less than or equal to the given number N. Logic is to change all bits of right side of MSB to 1. This will give a number which is (2*x - 1) where x is the required answer.

```c
long largest_power(long N)
{
    //Amazing logic to change all bits at right of MSB to 1
   //changing all right side bits to 1.
    N = N| (N>>1);
    N = N| (N>>2);
    N = N| (N>>4);
    N = N| (N>>8);

   //as now the number is 2 * x-1, where x is required answer, so adding 1 and dividing it by 2. 
   return (N+1)>>1;
}
```

- `x ^ ( x & (x-1))` : Returns the rightmost 1 in binary representation of x. 

- `x & (-x)` : Returns the rightmost 1 in binary representation of x

- `x | (1 << n)` : Returns the number x with the nth bit set.


#### Sorting Techniques

- Bubble Sort

```c
void bubble_sort( int A[ ], int n ) {
    int temp;
    for(int k = 0; k< n-1; k++) {
        // (n-k-1) is for ignoring comparisons of elements which have already been compared in earlier iterations

        for(int i = 0; i < n-k-1; i++) {
            if(A[ i ] > A[ i+1] ) {
                // here swapping of positions is being done.
                temp = A[ i ];
                A[ i ] = A[ i+1 ];
                A[ i + 1] = temp;
            }
        }
    }
}
```

- Selection Sort - Find minimum and start swapping from leftmost elements

```c
void selection_sort(int A[], int n) {
    // temporary variable to store the position of minimum element
    int minimum;

    // reduces the effective size of the array by one in  each iteration.
    for (int i = 0; i < n - 1; i++) {

        // assuming the first element to be the minimum of the unsorted array .
        minimum = i;

        // gives the effective size of the unsorted  array .
        for (int j = i + 1; j < n; j++) {
            if (A[j] < A[minimum]) { //finds the minimum element
                minimum = j;
            }
        }

        // putting minimum element on its proper position.
        swap(A[minimum], A[i]);
    }
}
```

- Insertion Sort - Maintain a sorted array and put a new element in the appropriate position in the sorted array

```c
void insertion_sort(int A[], int n) {
    for (int i = 0; i < n; i++) {
        /*storing current element whose left side is checked for its 
                 correct position .*/

        int temp = A[i];
        int j = i;

        /* check whether the adjacent element in left side is greater or
             less than the current element. */

        while (j > 0 && temp < A[j - 1]) {

            // moving the left side element to one position forward.
            A[j] = A[j - 1];
            j = j - 1;

        }
        // moving current element to its  correct position.
        A[j] = temp;
    }
}
```

- Merge Sort - Quite useful due to its O(N*logN) runtime.

```c
void merge(int A[], int start, int mid, int end) {
    //stores the starting position of both parts in temporary variables.
    int p = start, q = mid + 1;

    int Arr[end - start + 1], k = 0;

    for (int i = start; i <= end; i++) {
        if (p > mid) //checks if first part comes to an end or not .
            Arr[k++] = A[q++];

        else if (q > end) //checks if second part comes to an end or not
            Arr[k++] = A[p++];

        else if (A[p] < A[q]) //checks which part has smaller element.
            Arr[k++] = A[p++];

        else
            Arr[k++] = A[q++];
    }
    for (int p = 0; p < k; p++) {
        /* Now the real array has elements in sorted manner including both 
             parts.*/
        A[start++] = Arr[p];
    }
}

void merge_sort(int A[], int start, int end) {
    if (start < end) {
        int mid = (start + end) / 2; // defines the current array in 2 parts .
        merge_sort(A, start, mid); // sort the 1st part of array .
        merge_sort(A, mid + 1, end); // sort the 2nd part of array.

        // merge the both parts by comparing elements of both the parts.
        merge(A, start, mid, end);
    }
}
```
- Quick Sort - If randomized pivot is used, complexity varies between O(N^2) and O(N*logN)

```c
int partition(int A[], int start, int end) {
    int i = start + 1;
    int piv = A[start]; //make the first element as pivot element.
    for (int j = start + 1; j <= end; j++) {
        /*rearrange the array by putting elements which are less than pivot
           on one side and which are greater that on other. */

        if (A[j] < piv) {
            swap(A[i], A[j]);
            i += 1;
        }
    }
    swap(A[start], A[i - 1]); //put the pivot element in its proper place.
    return i - 1; //return the position of the pivot
}
void quick_sort ( int A[ ] ,int start , int end ) {
   if( start < end ) {
        //stores the position of pivot element
         int piv_pos = partition (A,start , end ) ;     
         quick_sort (A,start , piv_pos -1);    //sorts the left side of pivot.
         quick_sort ( A,piv_pos +1 , end) ; //sorts the right side of pivot.
   }
}
```

- Counting Sort - For each element a[i], increase count by 1 in aux[a[i]]. Complexity is O(N+K) where K is the maximum element in the input array.

```c
void counting_sort(int A[], int Aux[], int sortedA[], int N) {

    // First, find the maximum value in A[]
    int K = 0;
    for (int i = 0; i < N; i++) {
        K = max(K, A[i]);
    }

    // Initialize the elements of Aux[] with 0
    for (int i = 0; i <= K; i++) {
        Aux[i] = 0;
    }

    // Store the frequencies of each distinct element of A[],
    // by mapping its value as the index of Aux[] array
    for (int i = 0; i < N; i++) {
        Aux[A[i]]++;
    }

    int j = 0;
    for (int i = 0; i <= K; i++) {
        int tmp = Aux[i];
        // Aux stores which element occurs how many times,
        // Add i in sortedA[] according to the number of times i occured in A[]
        while (tmp--) {
            //cout << Aux[i] << endl;
            sortedA[j] = i;
            j++;
        }
    }
}
```

- Radix Sort - Modification of Counting Sort with focus on reducing complexity

```c
void countsort(int arr[], int n, int place) {
    int i, freq[range] = {
        0
    }; //range for integers is 10 as digits range from 0-9
    int output[n];
    for (i = 0; i < n; i++)
        freq[(arr[i] / place) % range]++;
    for (i = 1; i < range; i++)
        freq[i] += freq[i - 1];
    for (i = n - 1; i >= 0; i--) {
        output[freq[(arr[i] / place) % range] - 1] = arr[i];
        freq[(arr[i] / place) % range]--;
    }
    for (i = 0; i < n; i++)
        arr[i] = output[i];
}
void radixsort(ll arr[], int n, int maxx) //maxx is the maximum element in the array
{
    int mul = 1;
    while (maxx) {
        countsort(arr, n, mul);
        mul *= 10;
        maxx /= 10;
    }
 }
```

- Heap Sort - `max_heapify()` function must be first implemented. Complexity : `max_heapify()` has complexity O(logN), `build_maxheap()` has complexity O(N) and we run `max_heapify()` N−1 times in heap_sort function, therefore complexity of `heap_sort()` is O(NlogN).

```c
void heap_sort(int Arr[])
{
    int heap_size = N;
    build_maxheap(Arr);
    for (int i = N; i >= 2; i--) {
        swap | (Arr[1], Arr[i]);
        heap_size = heap_size - 1;
        max_heapify(Arr, 1, heap_size);
    }
}
```

- Bucket Sort - Mainly Useful when the input number are uniformly distributed over a range. Complexity O(n), if insertion complexity is O(1) {Possible using linked lists}.

```c
void bucketSort(float arr[], int n)
{
    // 1) Create n empty buckets
    vector<float> b[n];

    // 2) Put array elements in different buckets
    for (int i=0; i<n; i++)
    {
       int bi = n*arr[i]; // Index in bucket
       b[bi].push_back(arr[i]);
    }

    // 3) Sort individual buckets
    for (int i=0; i<n; i++)
       sort(b[i].begin(), b[i].end());

    // 4) Concatenate all buckets into arr[]
    int index = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < b[i].size(); j++)
          arr[index++] = b[i][j];
}

int main()
{
    float arr[] = {0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434};
    int n = sizeof(arr)/sizeof(arr[0]);
    bucketSort(arr, n);

    cout << "Sorted array is \n";
    for (int i=0; i<n; i++)
       cout << arr[i] << " ";
    return 0;
}
```


#### Data Structures 

- Stacks

```c
#include < iostream >
using namespace std;
int top = -1; //Globally defining the value of top as the stack is empty

void push(int stack[], int x, int n) {
    if (top == n - 1) //If the top position is the last of position of the stack, this means that the stack is full.
    {
        cout << "Stack is full.Overflow condition!";
    } else {
        top = top + 1; //Incrementing the top position 
        stack[top] = x; //Inserting an element on incremented position  
    }
}
bool isEmpty() {
    if (top == -1) //Stack is empty
        return true;
    else
        return false;
}
void pop() {

    if (isEmpty()) {
        cout << "Stack is empty. Underflow condition! " << endl;
    } else {
        top = top - 1; //Decrementing top’s position will detach last element from stack            
    }
}
int size() {
    return top + 1;
}
int topElement(int stack[]) {
        return stack[top];
    }
    //Let's implement these functions on the stack given above 

int main() {
    int stack[3];
    // pushing element 5 in the stack .
    push(stack, 5, 3);

    cout << "Current size of stack is " << size() << endl;

    push(stack, 10, 3);
    push(stack, 24, 3);

    cout << "Current size of stack is " << size() << endl;

    //As the stack is full, further pushing will show an overflow condition.
    push(stack, 12, 3);

    //Accessing the top element
    cout << "The current top element in stack is " << topElement(stack) << endl;

    //Removing all the elements from the stack
    for (int i = 0; i < 3; i++)
        pop();
    cout << "Current size of stack is " << size() << endl;

    //As the stack is empty , further popping will show an underflow condition.
    pop();

}
```

- Queue

```c
#include < iostream > #include < cstdio >

using namespace std;

void enqueue(char queue[], char element, int & rear, int arraySize) {
    if (rear == arraySize) // Queue is full
        printf("OverFlow\n");
    else {
        queue[rear] = element; // Add the element to the back
        rear++;
    }
}

void dequeue(char queue[], int & front, int rear) {
    if (front == rear) // Queue is empty
        printf("UnderFlow\n");
    else {
        queue[front] = 0; // Delete the front element
        front++;
    }
}

char Front(char queue[], int front) {
    return queue[front];
}

int main() {
    char queue[20] = {
        'a',
        'b',
        'c',
        'd'
    };
    int front = 0, rear = 4;
    int arraySize = 20; // Size of the array
    int N = 3; // Number of steps
    char ch;
    for (int i = 0; i < N; ++i) {
        ch = Front(queue, front);
        enqueue(queue, ch, rear, arraySize);
        dequeue(queue, front, rear);
    }
    for (int i = front; i < rear; ++i)
        printf("%c", queue[i]);
    printf("\n");
    return 0;
}
```

- Hash Tables

   - Choice of a Hash function is very important. It must be easy to compute, less collisions and must distribute output values uniformly.
   - Separate Chaining (Open Hashing) means having a collision element linked to the first element, and such links grows with more collisions.
   - Linear Probing/ Open Addressing/ Closed Hashing - using arrays to store values. Also quadratic probing can be used.
   - Double hashing techniques can also be used..
   - Mainly used to improve speed.
   
