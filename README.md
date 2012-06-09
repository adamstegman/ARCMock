# ARCMock

iOS has an issue with NSProxy objects under ARC, probably most commonly seen
when mocking delegates with [OCMock][ocmock]. This project includes an XCode
project that can be built and tested to demonstrate the issue.

[ocmock]: http://ocmock.org/

## The Issue

Basically, given a delegate protocol and a class that uses a delegate:

    @interface SomeClass : NSObject
    @property (nonatomic, weak) id<SomeDelegateProtocol> delegate;
    @end

Assigning a mock to that delegate property will see the mock immediately
nilled, even though it's held elsewhere with a strong reference.

    - (void)testSomeMethod {
      SomeClass *object = [[SomeClass alloc] init];
      id delegate = [OCMockObject mockForProtocol:@protocol(SomeDelegateProtocol)];
      object.delegate = delegate;
      STAssertNotNil(delegate, @"should have created delegate");
      STAssertNotNil(object.delegate, @"should have assigned delegate");
    }

The first assertion is there to illustrate that the actual object is not
deallocated, just the weak reference is lost. I don't understand why the
reference is nilled, since the object is not deallocated.

## Links

* [Stack Overflow question](http://stackoverflow.com/questions/8675054/why-is-my-objects-weak-delegate-property-nil-in-my-unit-tests)
* [Blog post](http://blog.adamstegman.com/nil-weak-reference-to-an-ocmock-mock-object.html)
* [OCMock forum post](http://www.mulle-kybernetik.com/forum/viewtopic.php?f=4&t=252)
