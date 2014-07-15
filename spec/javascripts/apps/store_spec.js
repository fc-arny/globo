describe('Angular store app', function() {
    // Controllers
    describe('gm.store.controllers', function() {
        describe('GoodsController', function() {

        });
    });

    // Filters
    describe('gm.store.filters', function() {
        describe('decimal_part', function() {
            var filter;

            beforeEach(function() {
                module('gm.store.filters');
                inject(function($injector){
                    filter = $injector.get('$filter')('decimal_part');
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