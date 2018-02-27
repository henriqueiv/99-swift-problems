import Foundation

class List<T> {
    var value: T
    var nextItem: List<T>?
    
    // Update to accept nested lists
    var description: String {
        var currentNode = self
        var array = [value]
        while (currentNode.nextItem != nil) {
            currentNode = currentNode.nextItem!
            array.append(currentNode.value)
        }
        
        return array.reduce("") { (result, item) -> String in
            return (result == "") ? "\(item)" : "\(result),\(item)"
        }
    }
    
    convenience init?(_ values: T...) {
        self.init(Array(values))
    }
    
    init?(_ values: [T]) {
        guard let first = values.first else { return nil }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }
    
    /** P01 (*) Find the last element of a linked list.
     - returns: T? the last element of a linked list.
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     */
    var last: T? {
        var currentNode = self
        while(currentNode.nextItem != nil) { currentNode = currentNode.nextItem! }
        return currentNode.value
    }
    
    /**
     P02 (*) Find the last but one element of a linked list.
     - returns:
     T? the last but one element of a linked list.
     
     - author:
     Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     
     - complexity:
     O(n)
     */
    var pennultimate: T? {
        var currentNode = self
        while(currentNode.nextItem?.nextItem != nil) { currentNode = currentNode.nextItem! }
        return currentNode.value
    }
    
    
    /** P03 (*) Find the Kth element of a linked list.
     - returns: T? the Kth element of a linked list.
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(k)
     - difficulty: 1/3
     */
    subscript(index: Int) -> T? {
        var currentIndex = 0
        var currentNode = self
        while(currentIndex < index) {
            guard let nextNode = currentNode.nextItem else { return nil }
            currentNode = nextNode
            currentIndex += 1
        }
        
        return currentNode.value
    }
    
    /** P04 (*) Find the number of elements of a linked list.
     - returns: Int the number of elements of a linked list
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     - difficulty: 1/3
     */
    var length: Int {
        var currentNode = self
        // Starts with 1 since we can't have an empty List<T>
        var length = 1
        while (currentNode.nextItem != nil) {
            length += 1
            currentNode = currentNode.nextItem!
        }
        return length
    }
    
    /** P05 (*) Reverse a linked list.
     - returns: List<T> a list containing the elements in the reverse order
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     - difficulty: 1/3
     */
    func reverse() -> List<T> {
        var currentNode = self
        var array = [value]
        while (currentNode.nextItem != nil) {
            currentNode = currentNode.nextItem!
            array.append(currentNode.value)
        }
        let reversedArray = Array<T>(array.reversed())
        return List(reversedArray)!
        
    }
    
    /** P07 (**) Flatten a nested linked list structure.
     - returns: List<T> the list flattened
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: unknown. It varies according to nesting level and number of elements
     - difficulty: 2/3
     - disclaimer: I'll build this without using Array's helpers
     */
    func flatten() -> List<T> {
        let array = dataFlatten()
        return List(array)!
    }
    
    private func dataFlatten() -> [T] {
        var result = [T]()
        var currentNode: List<T>? = self
        while (currentNode != nil) {
            if let listValue = currentNode!.value as? List<T> {
                result.append(contentsOf: listValue.dataFlatten())
            } else {
                result.append(currentNode!.value)
            }
            currentNode = currentNode!.nextItem
        }
        
        return result
    }
    
}

extension List where T: Equatable {
    static func ==(lhs: List, rhs: List) -> Bool {
        // To decrease complexity we use this variable
        let length = lhs.length
        guard length == rhs.length else {
            return false
        }
        
        for index in 0..<length {
            if lhs[index]! != rhs[index]! {
                return false
            }
        }
        
        return true
    }
    
    /** P06 (*) Find out whether a linked list is a palindrome.
     - returns: Bool indicate whether a linked list is a palindrome.
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     - difficulty: 1/3
     */
    func isPalindrome() -> Bool {
        return self == reverse()
    }
    
    /** P08 (**) Eliminate consecutive duplicates of linked list elements.
     - returns: List<T>
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity:
     - difficulty: 2/3
     */
    func compress() -> List<T> {
        var currentNode: List<T>? = self
        var array = [T]()
        while currentNode != nil {
            if array.isEmpty || ((array.last != nil) && (array.last! != currentNode?.value)) {
                array.append(currentNode!.value)
            }
            currentNode = currentNode!.nextItem
        }
        
        
        return List(array)!
    }
    
    /** P09 (**) Pack consecutive duplicates of linked list elements into sub linked lists.
     - returns: List<List<T>>
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity:
     - difficulty: 2/3
     */
    func pack() -> List<List<T>> {
        var currentNode: List<T>? = self
        var array: [List<T>] = [List<T>]()
        while currentNode != nil {
            if array.isEmpty || ((array.last != nil) && (array.last!.value != currentNode!.value)) {
                array.last!.nextItem = List(value)
            }
            currentNode = currentNode!.nextItem
        }
        
        
        return List.init(array)!
    }
}

