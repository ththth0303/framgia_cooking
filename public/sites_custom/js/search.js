var app1 = new Vue({
    el: '#cooking',
    data: {
        name: '',
        cookings: '',
        ingredients: '',
        ingredientName: '',
        selectIngredients: [],
    },
    mounted : function(){
        //
    },
    methods: {
        searchName: function(){
            axios.get('search/name?name=' + this.name).then((response) => {
                this.cookings = response.data;
            })
        },

        searchIngredient:function(){
            // alert('than')
            // axios.get('search/ingredient?name=' + this.ingredientName).then((response) => {
            //     this.ingredients = response.data;
            // })
        },

        addIngredient: function(ingredient){
            // this.selectIngredients['id' + ingredient.id] = ingredient;
            // this.ingredients = '';
            // console.log(this.selectIngredients)
        }
    }

});
