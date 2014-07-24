describe('Angular gm.util', function() {

    // Filters
    describe('gm.util.filters', function() {
        describe('decimal', function() {
            var filter;

            beforeEach(function() {
                module('gm.util.filters');
                inject(function($injector){
                    filter = $injector.get('$filter')('decimal');
                });
            });

            it('get value before point', function() {
                expect(filter(12.98, 'first')).toBe(12);
            });

            it('get value after point', function() {
                expect(filter(30.40, 'last')).toBe(40);
            });

            it('get value after point with leading zero', function() {
                expect(filter(30.05, 'last')).toBe('05');
            });
        });
    });
});