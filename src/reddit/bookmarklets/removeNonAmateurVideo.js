//javascript:
function removeNodes(parent) {
	var nodes = parent.querySelectorAll('.linkflairlabel:not([title="Amateur Video"])');
	for (let i = nodes.length - 1; i >= 0; i--) {
		nodes[i].closest('.thing').remove();
	};
	var nodes2 = parent.querySelectorAll('.thing .top-matter > .title > :not(.linkflairlabel):first-child');
	for (let i = nodes2.length - 1; i >= 0; i--) {
		nodes2[i].closest('.thing').remove();
	}
}

var target = document.getElementById('siteTable');
removeNodes(target);

var observer = new MutationObserver(function(mutations) {
	for(var i=0; i<mutations.length; ++i) {
		for(var j=0; j<mutations[i].addedNodes.length; ++j) {
			console.log(mutations[i].addedNodes[j]);
			removeNodes(target);
		}
	}

});

var config = { attributes: true, childList: true, characterData: true };

observer.observe(target, config);
