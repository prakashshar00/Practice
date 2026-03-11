def binarysearch (arr,TarVal):
    left = 0 
    right = len(arr) - 1

    while left <= right:
        mid = (left + right) // 2

        if arr[mid] == TarVal:
            return mid
        
        if arr[mid] < TarVal:
            left = mid + 1
        else:
            right = mid - 1
    
    return -1

mylist = [1,2,3,5,7,9,11,13,15,17,19]
x = 11
result = binarysearch(mylist,x)

if result != -1:
    print("Found at index",result)
else:
    print("Not found")
