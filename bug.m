In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider this scenario:

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    NSMutableArray *tempArray = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
    self.myArray = tempArray;
    [tempArray addObject:@"D"]; // ERROR! tempArray may be deallocated
}
```

The problem lies in the line `[tempArray addObject:@"D"];`.  Although `self.myArray` now points to `tempArray`, the local variable `tempArray` is soon deallocated, potentially leading to unexpected behavior or crashes if the original `tempArray` object is referenced elsewhere after it's deallocated. 