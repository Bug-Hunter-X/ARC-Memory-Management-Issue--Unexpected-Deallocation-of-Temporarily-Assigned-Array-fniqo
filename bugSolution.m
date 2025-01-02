The solution is to remove the direct operation on the `tempArray` and instead perform all operations using the `self.myArray` property:

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    NSMutableArray *tempArray = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
    self.myArray = tempArray;  // Assign to the property
    [self.myArray addObject:@"D"]; // Correct: Operate on the property
}
```

By using `self.myArray`, ARC ensures proper memory management, preventing premature deallocation of the array.