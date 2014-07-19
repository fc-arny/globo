describe('RequestQueue', function() {

    var queue;

    beforeEach(function() {
        queue = new RequestQueue(function(){
            console.log('Callback');
        });
    });

    it('push request data to queue', function() {
        queue.push({one: 'one'});
        expect(queue.get_queue().length).toBe(1);

        queue.push(1);
        expect(queue.get_queue().length).toBe(2);
    });

    it('must exec callback and lock others execs', function() {

    });
});