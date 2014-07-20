describe('RequestQueue', function() {

    var queue;

    beforeEach(function() {
        queue = new RequestQueue(function(){
            console.log('Callback');
        });
    });

    it('push request data to queue', function() {
        queue.push({one: 'one'});
        expect(queue._queue.length).toBe(1);

        queue.push(1);
        expect(queue._queue.length).toBe(2);
    });
});