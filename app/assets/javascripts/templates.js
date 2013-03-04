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
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.monogram;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
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
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.collar;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pocket\">Pocket:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.pocket;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"monogram\">Monogram:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.monogram;
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
  buffer += "\n    <li><a href=\"#\" class=\"label\" data-type=\"fabric\">Fabric:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.fabric;
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
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.vest;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
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
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.subcategory;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "custom-fabric", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)}) : helperMissing.call(depth0, "ifeq", stack1, "custom-fabric", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n  <li><a href=\"#\" class=\"label\" data-type=\"lapel\">Lapel:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.lapel;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"buttons\">Buttons:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.buttons;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"vents\">Vents:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.vents;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pleats\">Pleats:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.pleats;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pant_cuffs\">Cuffs:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.pant_cuffs;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(5, program5, data),fn:self.program(3, program3, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n</ul>\n<ul class=\"four columns\">\n  <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"lining\">Lining:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.lining;
  foundHelper = helpers.titleize;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "titleize", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"pick_stitching\">Pick Stitching:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(9, program9, data),fn:self.program(7, program7, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"vest\">Vest:</a> ";
  stack1 = depth0.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.vest;
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
templates['_customization_modal.hbs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers; partials = partials || Handlebars.partials; data = data || {};
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n      <li data-type=\"";
  stack1 = depth0.category;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\" ";
  stack1 = data.index;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "></li>\n    ";
  return buffer;}
function program2(depth0,data) {
  
  
  return "class=\"selected\"";}

function program4(depth0,data,depth1) {
  
  var buffer = "", stack1;
  buffer += "\n      <li class=\"customization-wrapper\" data-type=\"";
  stack1 = depth0.category;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\">\n        <p>";
  stack1 = depth0.description;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</p>\n        ";
  stack1 = depth0.custom;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(12, program12, data),fn:self.programWithDepth(program5, data, depth1),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n      </li>\n    ";
  return buffer;}
function program5(depth0,data,depth2) {
  
  var buffer = "", stack1;
  buffer += "\n          ";
  stack1 = depth0.monogram;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.programWithDepth(program6, data, depth2),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n          ";
  stack1 = depth0.fabric;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(8, program8, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        ";
  return buffer;}
function program6(depth0,data,depth3) {
  
  var buffer = "", stack1;
  buffer += "\n            <div class=\"row\">\n              <div class=\"customization-option six columns\">\n                <form id=\"monogram-form\">\n                  <label>Monogram (+$";
  stack1 = depth0.extra_cost;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + ") (";
  stack1 = depth0.max_length;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " character max) </label>\n                  <input type=\"text\" name=\"monogram\" maxlength=\"";
  stack1 = depth0.max_length;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\" value=\"";
  stack1 = depth3.customization;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.monogram;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\">\n                  <div class=\"row\">\n                    <div class=\"six columns\">\n                      <input type=\"submit\" class=\"button full-width\" value=\"Save\">\n                    </div>\n                    <div class=\"six columns\">\n                      <input type=\"button\" class=\"button full-width skip\" value=\"Skip\">\n                    </div>\n                  </div>\n                </form>\n              </div>\n            </div>\n          ";
  return buffer;}

function program8(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n            <div class=\"six columns\">\n              ";
  stack1 = depth0.options;
  foundHelper = helpers.eachProperty;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(9, program9, data),data:data}) : helperMissing.call(depth0, "eachProperty", stack1, {hash:{},inverse:self.noop,fn:self.program(9, program9, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n              <p class=\"centered\">Hover to magnify</p>\n            </div>\n            <div class=\"six columns\">\n              <div class=\"image-magnified\">\n                <img src=\"";
  stack1 = depth0.options;
  foundHelper = helpers.magnifiedFabricImg;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "magnifiedFabricImg", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + "\"></a>\n              </div>\n              <p class=\"centered fabric-label\">";
  stack1 = depth0.options;
  foundHelper = helpers.magnifiedFabricLabel;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "magnifiedFabricLabel", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + "</p>\n            </div>\n          ";
  return buffer;}
function program9(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n                <a href=\"#\" class=\"customization-option fabric three columns ";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.selected;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(10, program10, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\"\n                   data-option=\"";
  foundHelper = helpers.property;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.property; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\" data-label=\"";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.label;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\"\n                   data-large=\"";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.large_image;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\">\n                  <h5>&nbsp;</h5>\n                  <img src=\"";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.small_image;
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "imgSrc", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + "\">\n                </a>\n              ";
  return buffer;}
function program10(depth0,data) {
  
  
  return "selected";}

function program12(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n          ";
  stack1 = depth0.options;
  foundHelper = helpers.eachProperty;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.programWithDepth(program13, data, depth0),data:data}) : helperMissing.call(depth0, "eachProperty", stack1, {hash:{},inverse:self.noop,fn:self.programWithDepth(program13, data, depth0),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        ";
  return buffer;}
function program13(depth0,data,depth1) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n            <a href=\"#\" class=\"customization-option ";
  stack1 = depth1.options;
  foundHelper = helpers.numColumns;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "numColumns", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + " ";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.selected;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(14, program14, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " ";
  stack1 = depth1.category;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\" data-option=\"";
  foundHelper = helpers.property;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.property; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n              <h5>";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.label;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(18, program18, data),fn:self.program(16, program16, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</h5>\n              <img src=\"";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.image;
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "imgSrc", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + "\">\n              ";
  stack1 = depth1.no_recommendation;
  stack1 = helpers.unless.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(20, program20, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n            </a>\n          ";
  return buffer;}
function program14(depth0,data) {
  
  
  return "selected";}

function program16(depth0,data) {
  
  var buffer = "", stack1;
  buffer += " ";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.label;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " ";
  return buffer;}

function program18(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += " ";
  stack1 = depth0.property;
  foundHelper = helpers.titleizeWithNumbers;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "titleizeWithNumbers", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + " ";
  return buffer;}

function program20(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                ";
  stack1 = depth0.value;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1['default'];
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(21, program21, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n              ";
  return buffer;}
function program21(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n                  <div class=\"recommended\">\n                    <img src=\"";
  foundHelper = helpers.imgSrc;
  stack1 = foundHelper ? foundHelper.call(depth0, "logos/logo-stitch.png", {hash:{},data:data}) : helperMissing.call(depth0, "imgSrc", "logos/logo-stitch.png", {hash:{},data:data});
  buffer += escapeExpression(stack1) + "\" class=\"shield\"><span>Recommended</span>\n                  </div>\n                ";
  return buffer;}

function program23(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n          ";
  stack1 = depth0;
  stack1 = self.invokePartial(partials.customizationCheckoutSuit, 'customizationCheckoutSuit', stack1, helpers, partials, data);;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        ";
  return buffer;}

function program25(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n          ";
  stack1 = depth0;
  stack1 = self.invokePartial(partials.customizationCheckoutShirt, 'customizationCheckoutShirt', stack1, helpers, partials, data);;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        ";
  return buffer;}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<h3>";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " <span class=\"divider\">//</span> <span class=\"current-customization\">";
  stack1 = depth0.customizationOptions;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1[0];
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.category;
  foundHelper = helpers.titleize;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{},data:data}) : helperMissing.call(depth0, "titleize", stack1, {hash:{},data:data});
  buffer += escapeExpression(stack1) + "</span></h3>\n<div class=\"customizations\">\n  <ul class=\"progress-bar\">\n    ";
  stack1 = depth0.customizationOptions;
  stack1 = helpers.each.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    <li data-type=\"checkout\"></li>\n  </ul>\n  <ul class=\"customization-list\">\n    ";
  stack1 = depth0.customizationOptions;
  stack1 = helpers.each.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.programWithDepth(program4, data, depth0),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    <li class=\"customization-wrapper\" data-type=\"checkout\">\n      <div class=\"customization-summary row\">\n        ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.category;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "suit", {hash:{},inverse:self.program(25, program25, data),fn:self.program(23, program23, data),data:data}) : helperMissing.call(depth0, "ifeq", stack1, "suit", {hash:{},inverse:self.program(25, program25, data),fn:self.program(23, program23, data),data:data});
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
  buffer += "\n      <div class=\"three columns\">\n        <label for=\"measurement_crotch\">Crotch</label>\n        <input class=\"quick-measurement-input\" id=\"measurement_crotch\" name=\"measurement[crotch]\" size=\"30\" type=\"text\"\n               value=\"";
  foundHelper = helpers.crotch;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.crotch; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n      </div>\n      <div class=\"three columns\">\n        <label for=\"measurement_thigh\">Thigh</label>\n        <input class=\"quick-measurement-input\" id=\"measurement_thigh\" name=\"measurement[thigh]\" size=\"30\" type=\"text\"\n               value=\"";
  foundHelper = helpers.thigh;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.thigh; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"/>\n      </div>\n      <div class=\"three columns\">\n        <label for=\"measurement_pant_length\">Pant length</label>\n        <input class=\"quick-measurement-input\" id=\"measurement_pant_length\" name=\"measurement[pant_length]\" size=\"30\"\n               type=\"text\" value=\"";
  foundHelper = helpers.pant_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.pant_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
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
  foundHelper = helpers.small;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.small; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
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
  stack1 = depth0.product_photos;
  stack1 = helpers.each.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </ul>\n    <div class=\"magnify nine columns\">\n      <img class=\"magnify-small\" src=\"";
  stack1 = depth0.defaultProductImage;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.medium;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\">\n      <p>Hover to magnify</p>\n    </div>\n  </div>\n  <div class=\"seven columns\">\n    <div class=\"image-magnified\" style=\"display: none;\">\n      <img class=\"magnify-large\" src=\"";
  stack1 = depth0.defaultProductImage;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.original;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
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