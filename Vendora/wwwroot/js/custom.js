(function () {
	'use strict';

	var tinyslider = function() {
		var el = document.querySelectorAll('.testimonial-slider');

		if (el.length > 0) {
			var slider = tns({
				container: '.testimonial-slider',
				items: 1,
				axis: "horizontal",
				controlsContainer: "#testimonial-nav",
				swipeAngle: false,
				speed: 700,
				nav: true,
				controls: true,
				autoplay: true,
				autoplayHoverPause: true,
				autoplayTimeout: 3500,
				autoplayButtonOutput: false
			});
		}
	};
	tinyslider();

	


	var sitePlusMinus = function() {

		var value,
    		quantity = document.getElementsByClassName('quantity-container');

		function createBindings(quantityContainer) {
	      var quantityAmount = quantityContainer.getElementsByClassName('quantity-amount')[0];
	      var increase = quantityContainer.getElementsByClassName('increase')[0];
	      var decrease = quantityContainer.getElementsByClassName('decrease')[0];
	      increase.addEventListener('click', function (e) { increaseValue(e, quantityAmount); });
	      decrease.addEventListener('click', function (e) { decreaseValue(e, quantityAmount); });
	    }

	    function init() {
	        for (var i = 0; i < quantity.length; i++ ) {
						createBindings(quantity[i]);
	        }
	    };

	    function increaseValue(event, quantityAmount) {
	        value = parseInt(quantityAmount.value, 10);

	        console.log(quantityAmount, quantityAmount.value);

	        value = isNaN(value) ? 0 : value;
	        value++;
	        quantityAmount.value = value;
	    }

	    function decreaseValue(event, quantityAmount) {
	        value = parseInt(quantityAmount.value, 10);

	        value = isNaN(value) ? 0 : value;
	        if (value > 0) value--;

	        quantityAmount.value = value;
	    }
	    
	    init();
		
	};
	sitePlusMinus();


})()

// Back to Top Button Functionality
const backToTopButton = document.getElementById('backToTop');

window.addEventListener('scroll', () => {
	if (window.pageYOffset > 300) {
		backToTopButton.classList.add('show');
	} else {
		backToTopButton.classList.remove('show');
	}
});

backToTopButton.addEventListener('click', () => {
	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});
});

// Quantity controls
function increaseQuantity() {
	var input = document.getElementById('quantityInput');
	var currentVal = parseInt(input.value);
	var maxVal = parseInt(input.max);
	if (currentVal < maxVal) {
		input.value = currentVal + 1;
		document.getElementById('selectedQuantity').value = currentVal + 1;
	}
}

function decreaseQuantity() {
	var input = document.getElementById('quantityInput');
	var currentVal = parseInt(input.value);
	if (currentVal > 1) {
		input.value = currentVal - 1;
		document.getElementById('selectedQuantity').value = currentVal - 1;
	}
}

// Update quantity on input change
document.getElementById('quantityInput').addEventListener('change', function () {
	document.getElementById('selectedQuantity').value = this.value;
});

// Update variant selection
function updateVariant() {
	var select = document.getElementById('variantSelect');
	var selectedOption = select.options[select.selectedIndex];
	document.getElementById('selectedVariantId').value = selectedOption.value;
}

// Form validation before submit
document.getElementById('addToCartForm').addEventListener('submit', function (e) {
	var quantity = parseInt(document.getElementById('quantityInput').value);
	var stock = parseInt(document.getElementById('quantityInput').max);

	if (quantity > stock) {
		e.preventDefault();
		alert('Quantity exceeds available stock!');
	}
});