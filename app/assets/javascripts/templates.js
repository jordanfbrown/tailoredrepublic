(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['_add_success_modal.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n\n<h3>";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " has been added to your shopping cart.</h3>\n\n<div class=\"six columns button-column\">\n  <a href=\"/cart\" class=\"button\">View Cart</a>\n</div>\n<div class=\"six columns button-column\">\n  <a href=\"#\" class=\"button keep-shopping\">Keep Shopping</a>\n</div>\n\n<h4>Other styles you might also like:</h4>\n\n<div class=\"products-wrapper\">\n</div>\n\n";
  return buffer;});
templates['_customization_checkout_shirt.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  
  return "Yes";}

function program3(depth0,data) {
  
  
  return "No";}

function program5(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + " (+$";
  foundHelper = helpers.shirtMonogramPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.shirtMonogramPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")";
  return buffer;}

function program7(depth0,data) {
  
  
  return "None";}

function program9(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n    <a href=\"#\" class=\"button add-to-cart\"><img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "icons/shopping-cart.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "icons/shopping-cart.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\"> Add To Cart</a>\n  ";
  return buffer;}

function program11(depth0,data) {
  
  
  return "\n    <a href=\"#\" class=\"button save-changes\">Save Changes</a>\n  ";}

  buffer += "<p>Please read over your customizations one last time and ensure that they are correct. If you need to change any customizations, click on any of the categories below\n  to enter your new customization.\n</p>\n<ul class=\"six columns\">\n  <li><a href=\"#\" class=\"label\" data-type=\"collar\">Collar:</a> ";
  stack1 = depth0.collar;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pocket\">Pocket:</a> ";
  stack1 = depth0.pocket;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"monogram\">Monogram:</a> ";
  stack1 = depth0.monogram;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.length;
  foundHelper = helpers.ifGreaterThan;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.program(7, program7, data),fn:self.program(5, program5, data)}) : helperMissing.call(depth0, "ifGreaterThan", stack1, 0, {hash:{},inverse:self.program(7, program7, data),fn:self.program(5, program5, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n</ul>\n<div class=\"six columns\">\n  <ul>\n    <li><span class=\"label\">Total cost:</span> $";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  </ul>\n  ";
  stack1 = depth0.isNew;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(11, program11, data),fn:self.program(9, program9, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</div>";
  return buffer;});
templates['_customization_checkout_suit.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression, functionType="function", self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n    <li><a href=\"#\" class=\"label\" data-type=\"swatch\">Fabric:</a> ";
  stack1 = depth0.fabric;
  foundHelper = helpers.titleize;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "titleize", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  ";
  return buffer;}

function program3(depth0,data) {
  
  
  return "Yes";}

function program5(depth0,data) {
  
  
  return "No";}

function program7(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "Yes (+$";
  foundHelper = helpers.pickStitchingPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.pickStitchingPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ") ";
  return buffer;}

function program9(depth0,data) {
  
  
  return "No";}

function program11(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += " Yes, ";
  foundHelper = helpers.vest;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vest; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + " Buttons (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")";
  return buffer;}

function program13(depth0,data) {
  
  
  return "No";}

function program15(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n    <a href=\"#\" class=\"button add-to-cart\"><img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "icons/shopping-cart.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "icons/shopping-cart.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\"> Add To Cart</a>\n  ";
  return buffer;}

function program17(depth0,data) {
  
  
  return "\n    <a href=\"#\" class=\"button save-changes\">Save Changes</a>\n  ";}

  buffer += "<p>Please read over your customizations one last time and ensure that they are correct. If you need to change any customizations, click on any of the categories below\n  to enter your new customization.\n</p>\n<ul class=\"four columns\">\n  ";
  stack1 = depth0.chooseFabric;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n  <li><a href=\"#\" class=\"label\" data-type=\"lapel\">Lapel:</a> ";
  stack1 = depth0.lapel;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"buttons\">Buttons:</a> ";
  stack1 = depth0.buttons;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"vents\">Vents:</a> ";
  stack1 = depth0.vents;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pleats\">Pleats:</a> ";
  stack1 = depth0.pleats;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pant_cuffs\">Cuffs:</a> ";
  stack1 = depth0.pant_cuffs;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(5, program5, data),fn:self.program(3, program3, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n</ul>\n<ul class=\"four columns\">\n  <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"lining\">Lining:</a> ";
  stack1 = depth0.lining;
  foundHelper = helpers.titleize;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "titleize", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pick_stitching\">Pick Stitching:</a> ";
  stack1 = depth0.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(9, program9, data),fn:self.program(7, program7, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"vest\">Vest:</a> ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifGreaterThan;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.program(13, program13, data),fn:self.program(11, program11, data)}) : helperMissing.call(depth0, "ifGreaterThan", stack1, 0, {hash:{},inverse:self.program(13, program13, data),fn:self.program(11, program11, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n</ul>\n<div class=\"four columns\">\n  <ul>\n    <li><span class=\"label\">Total cost:</span> $";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  </ul>\n  ";
  stack1 = depth0.isNew;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(17, program17, data),fn:self.program(15, program15, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</div>";
  return buffer;});
templates['_customization_modal_shirt.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers; partials = partials || Handlebars.partials;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  
  return "selected";}

function program3(depth0,data) {
  
  
  return "selected";}

function program5(depth0,data) {
  
  
  return "selected";}

function program7(depth0,data) {
  
  
  return "selected";}

function program9(depth0,data) {
  
  
  return "selected";}

function program11(depth0,data) {
  
  
  return "selected";}

function program13(depth0,data) {
  
  
  return "selected";}

function program15(depth0,data) {
  
  
  return "selected";}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<h2>";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " <span class=\"divider\">//</span> <span class=\"current-customization\">Collar</span></h2>\n<div class=\"customizations\">\n  <ul class=\"progress-bar ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.category;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\">\n    <li data-type=\"collar\" class=\"selected\"></li>\n    <li data-type=\"fit\"></li>\n    <li data-type=\"pocket\"></li>\n    <li data-type=\"monogram\"></li>\n    <li data-type=\"checkout\"></li>\n  </ul>\n  <ul class=\"customization-list\">\n    <li class=\"customization-wrapper\" data-type=\"collar\">\n      <p>The standard or straight collars are always a nice, clean TR-approved look. The cutaway collar is a solid\n        option for someone that really wants to emphasize a wide tie knot, such as a Windsor. Button-down collars tend\n        to be slightly more casual and can be a nice choice if you are not wearing the shirt with a suit.</p>\n      <a href=\"#\" class=\"customization-option three shirt ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "standard", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)}) : helperMissing.call(depth0, "ifeq", stack1, "standard", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"standard\">\n        <h5>Standard</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/collar-standard.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/collar-standard.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option three shirt ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "cutaway", {hash:{},inverse:self.noop,fn:self.program(3, program3, data)}) : helperMissing.call(depth0, "ifeq", stack1, "cutaway", {hash:{},inverse:self.noop,fn:self.program(3, program3, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"cutaway\">\n        <h5>Cutaway</h5>\n        <img src=";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/collar-cutaway.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/collar-cutaway.png", {hash:{}});
  buffer += escapeExpression(stack1) + ">\n      </a>\n      <a href=\"#\" class=\"customization-option three shirt ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "straight", {hash:{},inverse:self.noop,fn:self.program(5, program5, data)}) : helperMissing.call(depth0, "ifeq", stack1, "straight", {hash:{},inverse:self.noop,fn:self.program(5, program5, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"straight\">\n        <h5>Straight</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/collar-straight.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/collar-straight.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option three shirt ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "button-down", {hash:{},inverse:self.noop,fn:self.program(7, program7, data)}) : helperMissing.call(depth0, "ifeq", stack1, "button-down", {hash:{},inverse:self.noop,fn:self.program(7, program7, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"button-down\">\n        <h5>Button Down</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/collar-button-down.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/collar-button-down.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"fit\">\n      <p>A slim fit helps to keep the shirt nice and tight to the body so that it doesn’t pooch out the suit in an\n        unsightly way. If you are a fuller-figure man or are planning on wearing the shirt without a suit, a normal fit\n        will look great.</p>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(9, program9, data)}) : helperMissing.call(depth0, "ifeq", stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(9, program9, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"slim\">\n        <h5>Slim</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/fit-slim.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/fit-slim.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(11, program11, data)}) : helperMissing.call(depth0, "ifeq", stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(11, program11, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"normal\">\n        <h5>Normal</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/fit-normal.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/fit-normal.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"pocket\">\n      <p>So the argument for pockets is that they are functional, but we say ditch the pocket and give your shirt that\n        clean look. This is especially true if you are rocking a skinny tie; a bulky pocket can really throw off the\n        whole balance of the look.</p>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.pocket;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(13, program13, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(13, program13, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"false\">\n        <h5>No Pocket</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/pocket-no.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/pocket-no.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.pocket;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(15, program15, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(15, program15, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"true\">\n        <h5>Pocket</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/shirts/pocket-yes.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/shirts/pocket-yes.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"monogram\">\n      <p>Shirt monogramming can be up to 3 characters, and is almost exclusively used to sport some initials. The\n        monogram will show up on the sleeve cuff that will poke out the bottom of your suit sleeve. TR tip: keep the\n        shirt monogram subtle and make it the same color of the shirt. It is still noticeable without being obnoxious.\n        Black on black, white on white, pink on pink, you get the idea.\n      </p>\n      <p class=\"label\">Note: Monograms cost an extra $";
  foundHelper = helpers.shirtMonogramPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.shirtMonogramPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ".</p>\n      <div class=\"customization-option six columns\">\n        <form id=\"monogram-form\">\n          <label>Monogram (+$";
  foundHelper = helpers.shirtMonogramPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.shirtMonogramPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ") (3 character max) </label>\n          <input type=\"text\" name=\"monogram\" maxlength=\"3\" value=\"";
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n          <input type=\"submit\" class=\"button full-width\" value=\"Ok\">\n        </form>\n      </div>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"checkout\">\n      <div class=\"customization-summary row\">\n        ";
  stack1 = depth0;
  stack1 = self.invokePartial(partials.customizationCheckoutShirt, 'customizationCheckoutShirt', stack1, helpers, partials);;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n      </div>\n    </li>\n  </ul>\n</div>\n<div class=\"row\">\n  <div class=\"six columns previous-col\">\n    <a href=\"#\" class=\"button previous\" style=\"display: none;\">Previous</a>\n  </div>\n  <div class=\"six columns next-col\">\n    <a href=\"#\" class=\"button next\">Next</a>\n  </div>\n</div>";
  return buffer;});
templates['_customization_modal_suit.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers; partials = partials || Handlebars.partials;
  var buffer = "", stack1, foundHelper, self=this, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression, functionType="function";

function program1(depth0,data) {
  
  
  return "Fabric";}

function program3(depth0,data) {
  
  
  return "Lapel";}

function program5(depth0,data) {
  
  
  return " suit-swatch ";}

function program7(depth0,data) {
  
  
  return "\n      <li data-type=\"swatch\" class=\"selected\"></li>\n      <li data-type=\"lapel\"></li>\n    ";}

function program9(depth0,data) {
  
  
  return "\n      <li data-type=\"lapel\" class=\"selected\"></li>\n    ";}

function program11(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n      <li class=\"customization-wrapper fabric\" data-type=\"fabric\">\n        <p>For the bold suit connoisseur we have the option to build your own suit; including selecting a unique fabric\n          that is not available in our permanent collection. Start by choosing one of our 100% wool premium fabrics\n          below.\n        </p>\n        <div class=\"row\">\n          <div class=\"six columns\">\n            <div class=\"three columns\">\n              <a href=\"#\" class=\"fabric-option ";
  stack1 = depth0.fabric;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "charcoal-pinstripe", {hash:{},inverse:self.noop,fn:self.program(12, program12, data)}) : helperMissing.call(depth0, "ifeq", stack1, "charcoal-pinstripe", {hash:{},inverse:self.noop,fn:self.program(12, program12, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\"\n                 data-id=\"charcoal-pinstripe\" data-label=\"Dark Charcoal w/ Wide Pinstripes\"\n                 data-large=\"customizations/suits/fabrics/charcoal-with-pinstripe-large.jpg\">\n                <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fabrics/charcoal-with-pinstripe-small.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fabrics/charcoal-with-pinstripe-small.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n              </a>\n            </div>\n            <div class=\"three columns\">\n              <a href=\"#\" class=\"fabric-option ";
  stack1 = depth0.fabric;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "granite-red", {hash:{},inverse:self.noop,fn:self.program(14, program14, data)}) : helperMissing.call(depth0, "ifeq", stack1, "granite-red", {hash:{},inverse:self.noop,fn:self.program(14, program14, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-id=\"granite-red\"\n                 data-label=\"Granite w/ Red Crosschecks\"\n                 data-large=\"customizations/suits/fabrics/granite-with-red-large.jpg\">\n                <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fabrics/granite-with-red-small.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fabrics/granite-with-red-small.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n              </a>\n            </div>\n            <div class=\"three columns\">\n              <a href=\"#\" class=\"fabric-option ";
  stack1 = depth0.fabric;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "heathered-light-gray", {hash:{},inverse:self.noop,fn:self.program(16, program16, data)}) : helperMissing.call(depth0, "ifeq", stack1, "heathered-light-gray", {hash:{},inverse:self.noop,fn:self.program(16, program16, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\"\n                 data-id=\"heathered-light-gray\" data-label=\"Heathered Light Gray\"\n                 data-large=\"customizations/suits/fabrics/heathered-light-gray-large.jpg\">\n                <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fabrics/heathered-light-gray-small.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fabrics/heathered-light-gray-small.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\"></a>\n            </div>\n            <div class=\"three columns\">\n              <a href=\"#\" class=\"fabric-option ";
  stack1 = depth0.fabric;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "stone-gray-with-blue", {hash:{},inverse:self.noop,fn:self.program(18, program18, data)}) : helperMissing.call(depth0, "ifeq", stack1, "stone-gray-with-blue", {hash:{},inverse:self.noop,fn:self.program(18, program18, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\"\n                 data-id=\"stone-gray-with-blue\" data-label=\"Stone Gray w/ Blue Crosschecks\"\n                 data-large=\"customizations/suits/fabrics/stone-gray-with-blue-large.jpg\">\n                <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fabrics/stone-gray-with-blue-small.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fabrics/stone-gray-with-blue-small.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\"></a>\n            </div>\n            <p class=\"centered\">Hover to magnify</p>\n          </div>\n          <div class=\"six columns\">\n            <div class=\"image-magnified\">\n              <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fabrics/charcoal-with-pinstripe-large.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fabrics/charcoal-with-pinstripe-large.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\"></a>\n            </div>\n            <p class=\"centered fabric-label\">Dark Charcoal w/ Wide Pinstripes</p>\n          </div>\n        </div>\n      </li>\n    ";
  return buffer;}
function program12(depth0,data) {
  
  
  return "selected";}

function program14(depth0,data) {
  
  
  return "selected";}

function program16(depth0,data) {
  
  
  return "selected";}

function program18(depth0,data) {
  
  
  return "selected";}

function program20(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n        <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "The Tuxedo", {hash:{},inverse:self.program(23, program23, data),fn:self.program(21, program21, data)}) : helperMissing.call(depth0, "ifeq", stack1, "The Tuxedo", {hash:{},inverse:self.program(23, program23, data),fn:self.program(21, program21, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "shawl", {hash:{},inverse:self.noop,fn:self.program(25, program25, data)}) : helperMissing.call(depth0, "ifeq", stack1, "shawl", {hash:{},inverse:self.noop,fn:self.program(25, program25, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"shawl\">\n          <h5>Shawl</h5>\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/lapel-shawl.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/lapel-shawl.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n          <div class=\"recommended\">\n            <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n          </div>\n        </a>\n      ";
  return buffer;}
function program21(depth0,data) {
  
  
  return "three tuxedo";}

function program23(depth0,data) {
  
  
  return "four";}

function program25(depth0,data) {
  
  
  return "selected";}

function program27(depth0,data) {
  
  
  return "three tuxedo";}

function program29(depth0,data) {
  
  
  return "four";}

function program31(depth0,data) {
  
  
  return "selected";}

function program33(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n          <div class=\"recommended\">\n            <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n          </div>\n        ";
  return buffer;}

function program35(depth0,data) {
  
  
  return "three tuxedo";}

function program37(depth0,data) {
  
  
  return "four";}

function program39(depth0,data) {
  
  
  return "selected";}

function program41(depth0,data) {
  
  
  return "three tuxedo";}

function program43(depth0,data) {
  
  
  return "four";}

function program45(depth0,data) {
  
  
  return "selected";}

function program47(depth0,data) {
  
  
  return "selected";}

function program49(depth0,data) {
  
  
  return "selected";}

function program51(depth0,data) {
  
  
  return "selected";}

function program53(depth0,data) {
  
  
  return "selected";}

function program55(depth0,data) {
  
  
  return "selected";}

function program57(depth0,data) {
  
  
  return "selected";}

function program59(depth0,data) {
  
  
  return "selected";}

function program61(depth0,data) {
  
  
  return "selected";}

function program63(depth0,data) {
  
  
  return "selected";}

function program65(depth0,data) {
  
  
  return "selected";}

function program67(depth0,data) {
  
  
  return "selected";}

function program69(depth0,data) {
  
  
  return "selected";}

function program71(depth0,data) {
  
  
  return "selected";}

function program73(depth0,data) {
  
  
  return "selected";}

function program75(depth0,data) {
  
  
  return "selected";}

function program77(depth0,data) {
  
  
  return "selected";}

function program79(depth0,data) {
  
  
  return "selected";}

function program81(depth0,data) {
  
  
  return "selected";}

function program83(depth0,data) {
  
  
  return "selected";}

function program85(depth0,data) {
  
  
  return "selected";}

function program87(depth0,data) {
  
  
  return "selected";}

function program89(depth0,data) {
  
  
  return "selected";}

function program91(depth0,data) {
  
  
  return "selected";}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<h3>";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " <span class=\"divider\">//</span> <span class=\"current-customization\">";
  stack1 = depth0.chooseFabric;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</span></h3>\n<div class=\"customizations\">\n  <ul class=\"progress-bar ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.category;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " ";
  stack1 = depth0.chooseFabric;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(5, program5, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">\n    ";
  stack1 = depth0.chooseFabric;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(9, program9, data),fn:self.program(7, program7, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    <li data-type=\"buttons\"></li>\n    <li data-type=\"vents\"></li>\n    <li data-type=\"pleats\"></li>\n    <li data-type=\"pant_cuffs\"></li>\n    <li data-type=\"fit\"></li>\n    <li data-type=\"lining\"></li>\n    <li data-type=\"pick_stitching\"></li>\n    <li data-type=\"vest\"></li>\n    <li data-type=\"checkout\"></li>\n  </ul>\n  <ul class=\"customization-list\">\n    ";
  stack1 = depth0.chooseFabric;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(11, program11, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    <li class=\"customization-wrapper\" data-type=\"lapel\">\n      <p>Notch lapels are the most widely used lapels and are a safe and stylish choice for any suit. Peak lapels add a\n        little pizazz for those who want to stand out. TR tip: If you are unsure, go with the notch lapel, you don’t\n        necessarily want anything to distract from the perfect fit of your tailored suit.</p>\n      ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "The Tuxedo", {hash:{},inverse:self.noop,fn:self.program(20, program20, data)}) : helperMissing.call(depth0, "ifeq", stack1, "The Tuxedo", {hash:{},inverse:self.noop,fn:self.program(20, program20, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "The Tuxedo", {hash:{},inverse:self.program(29, program29, data),fn:self.program(27, program27, data)}) : helperMissing.call(depth0, "ifeq", stack1, "The Tuxedo", {hash:{},inverse:self.program(29, program29, data),fn:self.program(27, program27, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "notch", {hash:{},inverse:self.noop,fn:self.program(31, program31, data)}) : helperMissing.call(depth0, "ifeq", stack1, "notch", {hash:{},inverse:self.noop,fn:self.program(31, program31, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"notch\">\n        <h5>Notch</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/lapel-notch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/lapel-notch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  foundHelper = helpers.ifNotEq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "The Tuxedo", {hash:{},inverse:self.noop,fn:self.program(33, program33, data)}) : helperMissing.call(depth0, "ifNotEq", stack1, "The Tuxedo", {hash:{},inverse:self.noop,fn:self.program(33, program33, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n      </a>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "The Tuxedo", {hash:{},inverse:self.program(37, program37, data),fn:self.program(35, program35, data)}) : helperMissing.call(depth0, "ifeq", stack1, "The Tuxedo", {hash:{},inverse:self.program(37, program37, data),fn:self.program(35, program35, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "peak", {hash:{},inverse:self.noop,fn:self.program(39, program39, data)}) : helperMissing.call(depth0, "ifeq", stack1, "peak", {hash:{},inverse:self.noop,fn:self.program(39, program39, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"peak\">\n        <h5>Peak</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/lapel-peak.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/lapel-peak.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "The Tuxedo", {hash:{},inverse:self.program(43, program43, data),fn:self.program(41, program41, data)}) : helperMissing.call(depth0, "ifeq", stack1, "The Tuxedo", {hash:{},inverse:self.program(43, program43, data),fn:self.program(41, program41, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "narrow", {hash:{},inverse:self.noop,fn:self.program(45, program45, data)}) : helperMissing.call(depth0, "ifeq", stack1, "narrow", {hash:{},inverse:self.noop,fn:self.program(45, program45, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"narrow\">\n        <h5>Narrow</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/lapel-narrow.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/lapel-narrow.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"buttons\">\n      <p>The modern standard and a fashionable choice is the two button suit. Two button suits fit more of a classic\n        style and look great on taller guys. A one button suit is a very stylish option for those who want to be\n        adventurous. TR tip: If you are going to add a vest, stick with the two button jacket.</p>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(47, program47, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(47, program47, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"1\">\n        <h5>One</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/buttons-one.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/buttons-one.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(49, program49, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(49, program49, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"2\">\n        <h5>Two</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/buttons-two.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/buttons-two.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 3, {hash:{},inverse:self.noop,fn:self.program(51, program51, data)}) : helperMissing.call(depth0, "ifeq", stack1, 3, {hash:{},inverse:self.noop,fn:self.program(51, program51, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"3\">\n        <h5>Three</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/buttons-three.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/buttons-three.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"vents\">\n      <p>Having two vents is the traditional, safe and stylish choice. One vent is a way to make your suit modern and\n        sleek without distracting from the excellent fit (we love the single vent). TR tip: If you are a shorter guy,\n        go ahead and get the double vent, the vertical vents help to draw the eye upward and elongate the body.</p>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(53, program53, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(53, program53, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"0\">\n        <h5>None</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vents-none.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vents-none.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(55, program55, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(55, program55, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"1\">\n        <h5>One</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vents-one.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vents-one.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(57, program57, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(57, program57, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"2\">\n        <h5>Two</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vents-two.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vents-two.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"pleats\">\n      <p>Pleats are typically associated with old-fashioned suits. If you are looking for a modern, trendier look, we\n        recommend going with no pleats and no cuffs on the pants.</p>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(59, program59, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(59, program59, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"0\">\n        <h5>None</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/pleats-none.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/pleats-none.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(61, program61, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(61, program61, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"1\">\n        <h5>One</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/pleats-one.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/pleats-one.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(63, program63, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(63, program63, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"2\">\n        <h5>Two</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/pleats-two.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/pleats-two.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"pant_cuffs\">\n      <p>Pant cuffs were a suit staple in previous decades, but unless you are going for an older, more classic look,\n        we recommend sticking with no pant cuffs. It keeps the suit lines clean and sharp, keeping those heads on a\n        swivel.</p>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.pant_cuffs;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(65, program65, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(65, program65, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"false\">\n        <h5>None</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/cuffs-no.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/cuffs-no.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"cuffs\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.pant_cuffs;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(67, program67, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(67, program67, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"true\">\n        <h5>Cuffs</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/cuffs-yes.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/cuffs-yes.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"cuffs\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"fit\">\n      <p>The tailored fit is guaranteed to look great on most guys. A regular fit is great for guys with a fuller\n        figure. And the slim fit is great for lean guys who want a very tight fitting suit and know they will not have\n        any weight changes in the future. TR tip: Regardless of the fit option, our suits are tailored to your\n        measurements, so slim or full-figured, your suit will look and feel great.</p>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(69, program69, data)}) : helperMissing.call(depth0, "ifeq", stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(69, program69, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"slim\">\n        <h5>Slim</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fit-slim.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fit-slim.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "tailored", {hash:{},inverse:self.noop,fn:self.program(71, program71, data)}) : helperMissing.call(depth0, "ifeq", stack1, "tailored", {hash:{},inverse:self.noop,fn:self.program(71, program71, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"tailored\">\n        <h5>Tailored</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fit-tailored.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fit-tailored.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(73, program73, data)}) : helperMissing.call(depth0, "ifeq", stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(73, program73, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"normal\">\n        <h5>Normal</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/fit-normal.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/fit-normal.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper linings\" data-type=\"lining\">\n      <p>The most common selection is matching lining, which works with the suit to bring out the fabrics natural\n        intrigue. Contrasting linings are a great choice if you want to add a little flash to your suit, making your\n        suit stand out. TR tip: A unique lining is a great way to make your suit stand out and really separates your\n        suit from the off-the-rack crowd; we recommend being bold.</p>\n      <div class=\"row\">\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option ";
  stack1 = depth0.lining;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "black", {hash:{},inverse:self.noop,fn:self.program(75, program75, data)}) : helperMissing.call(depth0, "ifeq", stack1, "black", {hash:{},inverse:self.noop,fn:self.program(75, program75, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-id=\"black\">\n            <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/linings/black.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/linings/black.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n            <span class=\"label\">Black</span>\n          </a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option ";
  stack1 = depth0.lining;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "gray", {hash:{},inverse:self.noop,fn:self.program(77, program77, data)}) : helperMissing.call(depth0, "ifeq", stack1, "gray", {hash:{},inverse:self.noop,fn:self.program(77, program77, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-id=\"gray\">\n            <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/linings/gray.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/linings/gray.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n            <span class=\"label\">Gray</span>\n          </a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option ";
  stack1 = depth0.lining;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "navy", {hash:{},inverse:self.noop,fn:self.program(79, program79, data)}) : helperMissing.call(depth0, "ifeq", stack1, "navy", {hash:{},inverse:self.noop,fn:self.program(79, program79, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-id=\"navy\">\n            <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/linings/navy.jpg", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/linings/navy.jpg", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n            <span class=\"label\">Navy</span>\n          </a>\n        </div>\n      </div>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"pick_stitching\">\n      <p>Pick stitching really emphasizes the stitching on your suit making it clear that you went with a tailored\n        option. This is a fairly bold look, so we recommend opting out unless you are familiar with the look and know\n        you want it.\n      </p>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.pick_stitching;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(81, program81, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(81, program81, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"false\">\n        <h5>No</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/pick-stitching-no.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/pick-stitching-no.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"pick-stitching\">\n        <div class=\"recommended\">\n          <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option ";
  stack1 = depth0.pick_stitching;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(83, program83, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(83, program83, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"true\">\n        <h5>Yes (+$";
  foundHelper = helpers.pickStitchingPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.pickStitchingPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/pick-stitching-yes.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/pick-stitching-yes.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\" class=\"pick-stitching\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"vest\">\n      <p>Do you want to make your suit a three-piece? You can add a matching vest to your suit order for $79. A\n        three-piece suit is sure to draw looks and makes a bold statement that you are serious about your style game.</p>\n      <a href=\"#\" class=\"customization-option three vest ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(85, program85, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(85, program85, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"0\">\n        <h5>No Vest (+$0)</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vest-no.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vest-no.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option three vest ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 3, {hash:{},inverse:self.noop,fn:self.program(87, program87, data)}) : helperMissing.call(depth0, "ifeq", stack1, 3, {hash:{},inverse:self.noop,fn:self.program(87, program87, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"3\">\n        <h5>3 Buttons (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vest-three.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vest-three.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option three vest ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 4, {hash:{},inverse:self.noop,fn:self.program(89, program89, data)}) : helperMissing.call(depth0, "ifeq", stack1, 4, {hash:{},inverse:self.noop,fn:self.program(89, program89, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"4\">\n        <h5>4 Buttons (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vest-four.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vest-four.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n      <a href=\"#\" class=\"customization-option three vest ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 5, {hash:{},inverse:self.noop,fn:self.program(91, program91, data)}) : helperMissing.call(depth0, "ifeq", stack1, 5, {hash:{},inverse:self.noop,fn:self.program(91, program91, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" data-option=\"5\">\n        <h5>5 Buttons (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")</h5>\n        <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "customizations/suits/vest-five.png", {hash:{}}) : helperMissing.call(depth0, "imgSrc", "customizations/suits/vest-five.png", {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      </a>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"checkout\">\n      <div class=\"customization-summary row\">\n        ";
  stack1 = depth0;
  stack1 = self.invokePartial(partials.customizationCheckoutSuit, 'customizationCheckoutSuit', stack1, helpers, partials);;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n      </div>\n    </li>\n  </ul>\n</div>\n<div class=\"row prev-next-row\">\n  <div class=\"six columns previous-col\">\n    <a href=\"#\" class=\"button previous\" style=\"display: none;\">Previous</a>\n  </div>\n  <div class=\"six columns next-col\">\n    <a href=\"#\" class=\"button next\">Next</a>\n  </div>\n</div>";
  return buffer;});
templates['_dialog_modal.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n  <div class=\"twelve columns\">\n    <a href=\"#\" class=\"confirm button\">";
  foundHelper = helpers.confirmText;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.confirmText; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</a>\n  </div>\n";
  return buffer;}

function program3(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n  <div class=\"six columns\">\n    <a href=\"#\" class=\"confirm button\">";
  foundHelper = helpers.confirmText;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.confirmText; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</a>\n  </div>\n  <div class=\"six columns\">\n    <a href=\"#\" class=\"cancel button\">";
  foundHelper = helpers.cancelText;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.cancelText; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</a>\n  </div>\n";
  return buffer;}

  buffer += "<div class=\"twelve columns\">\n  <p>";
  foundHelper = helpers.text;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.text; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</p>\n</div>\n\n";
  stack1 = depth0.confirmOnly;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;});
templates['_measurement_summary.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n      <div class=\"three columns\">\n        <label for=\"measurement_pant_length\">Pant length</label>\n        <input class=\"quick-measurement-input\" id=\"measurement_pant_length\" name=\"measurement[pant_length]\" size=\"30\"\n               type=\"text\" value=\"";
  foundHelper = helpers.pant_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.pant_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n      </div>\n      <div class=\"three columns\">\n        <label for=\"measurement_crotch\">Crotch</label>\n        <input class=\"quick-measurement-input\" id=\"measurement_crotch\" name=\"measurement[crotch]\" size=\"30\" type=\"text\"\n               value=\"";
  foundHelper = helpers.crotch;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.crotch; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n      </div>\n      <div class=\"three columns\">\n        <label for=\"measurement_thigh\">Thigh</label>\n        <input class=\"quick-measurement-input\" id=\"measurement_thigh\" name=\"measurement[thigh]\" size=\"30\" type=\"text\"\n               value=\"";
  foundHelper = helpers.thigh;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.thigh; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n      </div>\n    ";
  return buffer;}

  buffer += "<div class=\"row\">\n  <div class=\"twelve columns\">\n    <p class=\"accept-text\">Please read over your measurements and verify that they are correct. If they\n      look good, click \"Accept\" to continue. If you need to change a measurement, click on any of the categories below\n      to correct the value.\n    </p>\n  </div>\n</div>\n\n<div class=\"twelve columns\">\n  <form accept-charset=\"UTF-8\" action=\"\" class=\"quick-measurement-form\" method=\"post\">\n    <div class=\"three columns\">\n      <label for=\"measurement_age\">Age</label>\n      <input id=\"measurement_age\" name=\"measurement[age]\" size=\"30\" type=\"text\" value=\"";
  foundHelper = helpers.age;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.age; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_height\">Height (in.)</label>\n      <input id=\"measurement_height\" name=\"measurement[height]\" size=\"30\" type=\"text\" value=\"";
  foundHelper = helpers.height;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.height; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_weight\">Weight (lbs)</label>\n      <input id=\"measurement_weight\" name=\"measurement[weight]\" size=\"30\" type=\"text\" value=\"";
  foundHelper = helpers.weight;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.weight; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_neck\">Neck</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_neck\" name=\"measurement[neck]\" size=\"30\" type=\"text\"\n             value=\"";
  foundHelper = helpers.neck;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.neck; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_chest\">Chest</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_chest\" name=\"measurement[chest]\" size=\"30\" type=\"text\"\n      value=\"";
  foundHelper = helpers.chest;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.chest; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_stomach\">Stomach</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_stomach\" name=\"measurement[stomach]\" size=\"30\" type=\"text\"\n      value=\"";
  foundHelper = helpers.stomach;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.stomach; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_waist\">Waist</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_waist\" name=\"measurement[waist]\" size=\"30\" type=\"text\"\n             value=\"";
  foundHelper = helpers.waist;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.waist; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_hips\">Hips</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_hips\" name=\"measurement[hips]\" size=\"30\" type=\"text\"\n             value=\"";
  foundHelper = helpers.hips;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.hips; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_full_shoulders\">Full shoulders</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_full_shoulders\" name=\"measurement[full_shoulders]\" size=\"30\"\n             type=\"text\" value=\"";
  foundHelper = helpers.full_shoulders;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.full_shoulders; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_back\">Back</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_back\" name=\"measurement[back]\" size=\"30\" type=\"text\"\n             value=\"";
  foundHelper = helpers.back;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.back; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_arm_length\">Arm length</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_arm_length\" name=\"measurement[arm_length]\" size=\"30\"\n             type=\"text\" value=\"";
  foundHelper = helpers.arm_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.arm_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_bicep\">Bicep</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_bicep\" name=\"measurement[bicep]\" size=\"30\" type=\"text\"\n             value=\"";
  foundHelper = helpers.bicep;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.bicep; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_wrist\">Wrist</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_wrist\" name=\"measurement[wrist]\" size=\"30\" type=\"text\"\n             value=\"";
  foundHelper = helpers.wrist;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.wrist; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    <div class=\"three columns\">\n      <label for=\"measurement_jacket_length\">Jacket length</label>\n      <input class=\"quick-measurement-input\" id=\"measurement_jacket_length\" name=\"measurement[jacket_length]\" size=\"30\"\n             type=\"text\" value=\"";
  foundHelper = helpers.jacket_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.jacket_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n    </div>\n    ";
  stack1 = depth0.shirtOnly;
  stack1 = helpers.unless.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    <div class=\"twelve columns\">\n      <ul class=\"error error-list\"></ul>\n    </div>\n    <a href=\"#\" class=\"button full-width large accept-quick\">Accept</a>\n  </form>\n</div>\n";
  return buffer;});
templates['_new_user_modal.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  


  return "<div class=\"row\">\n  <div class=\"twelve columns\">\n    <h2>Create Account</h2>\n    <p>We noticed that you don't have an account. If you'd like your measurements to be saved, please create an account.\n      If you don't want to create an account at the moment, click \"Cancel\". Although doing this will not save your\n      measurements for later use once you leave the site.</p>\n    <p class=\"error\" style=\"display: none;\">There were some problems creating your account:</p>\n    <ul class=\"error\" style=\"display: none;\"></ul>\n    <form accept-charset=\"UTF-8\" action=\"/users\" class=\"new_user\" id=\"new_user\" method=\"post\">\n      <label for=\"user_name\">Name</label>\n      <input id=\"user_name\" name=\"user[name]\" size=\"30\" type=\"text\"/>\n      <label for=\"user_email\">Email</label>\n      <input id=\"user_email\" name=\"user[email]\" size=\"30\" type=\"email\"/>\n      <label for=\"user_password\">Password</label>\n      <input id=\"user_password\" name=\"user[password]\" size=\"30\" type=\"password\" data-typetoggle=\"#show_password\"/>\n      <label><input type=\"checkbox\" id=\"show_password\">Show password</label>\n      <input id=\"measurement_id\" name=\"measurement_id\" type=\"hidden\" value=\"52\">\n      <div class=\"row\">\n        <div class=\"six columns\">\n          <input class=\"button full-width\" name=\"commit\" type=\"submit\" value=\"Sign Up\" />\n        </div>\n        <div class=\"six columns\">\n          <a href=\"#\" class=\"button full-width cancel\">Cancel</a>\n        </div>\n      </div>\n    </form>\n  </div>\n</div>";});
templates['_product.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression, functionType="function";


  buffer += "<a href=\"#\"><img src=\"";
  stack1 = depth0.defaultProductImage;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.regular;
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "imgSrc", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "\"></a>\n<div class=\"product-info-wrapper\">\n  <div class=\"product-info\">\n    <div class=\"product-name\">\n      <a href=\"#\">";
  foundHelper = helpers.name;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "<span class=\"divider\"> // </span><span class=\"dollar\">$</span>";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</a>\n    </div>\n    <a href=\"#\" class=\"customize\">View</a>\n  </div>\n</div>\n";
  return buffer;});
templates['_product_modal.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n        <li><a href=\"#\" class=\"switch-image\" data-id=\"";
  foundHelper = helpers.id;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"><img src=\"";
  stack1 = depth0.thumbnail;
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "imgSrc", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "\"></a></li>\n      ";
  return buffer;}

function program3(depth0,data) {
  
  
  return "\n        <a href=\"#\" class=\"customize button large full-width\">Customize</a>\n      ";}

function program5(depth0,data) {
  
  
  return "\n        <a href=\"#\" class=\"add-to-cart-no-customization button large full-width\">Add to Cart</a>\n      ";}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<div class=\"row\">\n  <h2 class=\"eight columns\">";
  foundHelper = helpers.name;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "<span class=\"divider\">&nbsp;//&nbsp;</span>$";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</h2>\n</div>\n<div class=\"row\">\n  <div class=\"five columns preview-wrapper\">\n    <ul class=\"modal-suit-preview three columns\">\n      ";
  stack1 = depth0.product_images;
  stack1 = helpers.each.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </ul>\n    <div class=\"magnify nine columns\">\n      <img class=\"magnify-small\" src=\"";
  stack1 = depth0.defaultProductImage;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.regular;
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "imgSrc", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n      <p>Hover to magnify</p>\n    </div>\n  </div>\n  <div class=\"seven columns\">\n    <div class=\"image-magnified\" style=\"display: none;\">\n      <img class=\"magnify-large\" src=\"";
  stack1 = depth0.defaultProductImage;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.large;
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "imgSrc", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "\">\n    </div>\n    <div class=\"product-summary\">\n      <h4>";
  foundHelper = helpers.summary;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.summary; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</h4>\n      <p class=\"blurb\">";
  foundHelper = helpers.description;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.description; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</p>\n      ";
  stack1 = depth0.customizable;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(5, program5, data),fn:self.program(3, program3, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </div>\n  </div>\n</div>\n";
  return buffer;});
})();