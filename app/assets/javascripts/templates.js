(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['_add_success_modal.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n\n<h3>The ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " has been added to your shopping cart.</h3>\n\n<div class=\"six columns button-column\">\n  <a href=\"/cart\" class=\"button\">View Cart</a>\n</div>\n<div class=\"six columns button-column\">\n  <a href=\"#\" class=\"button keep-shopping\">Keep Shopping</a>\n</div>\n\n<h4>Other styles you might also like:</h4>\n\n<div class=\"products-wrapper\">\n</div>\n\n";
  return buffer;});
templates['_customization_checkout.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  
  return "Yes";}

function program3(depth0,data) {
  
  
  return "No";}

function program5(depth0,data) {
  
  
  return "Yes";}

function program7(depth0,data) {
  
  
  return "No";}

function program9(depth0,data) {
  
  
  return "Yes";}

function program11(depth0,data) {
  
  
  return "No";}

function program13(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "Yes (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")";
  return buffer;}

function program15(depth0,data) {
  
  
  return "No";}

function program17(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n  <li><a href=\"#\" class=\"label\" data-type=\"vest_buttons\">Vest Buttons:</a> ";
  foundHelper = helpers.vest_buttons;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vest_buttons; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n  ";
  return buffer;}

function program19(depth0,data) {
  
  
  return "\n  <a href=\"#\" class=\"add-to-cart\"><img src=\"/assets/icons/cart-black.png\"></a>\n  <a href=\"#\" class=\"button add-to-cart\">Add To Cart</a>\n  ";}

function program21(depth0,data) {
  
  
  return "\n  <a href=\"#\" class=\"button save-changes\">Save Changes</a>\n  ";}

  buffer += "<ul class=\"four columns\">\n  <li><a href=\"#\" class=\"label\" data-type=\"lapel\">Lapel:</a> ";
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
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n</ul>\n<ul class=\"four columns\">\n  <li><a href=\"#\" class=\"label\" data-type=\"lining\">Lining:</a> ";
  foundHelper = helpers.lining;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.lining; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"monogram\">Monogram:</a> ";
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"advanced\">Bouttoniere:</a> ";
  stack1 = depth0.bouttoniere;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(7, program7, data),fn:self.program(5, program5, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"advanced\">Pick Stitching:</a> ";
  stack1 = depth0.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(11, program11, data),fn:self.program(9, program9, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  <li><a href=\"#\" class=\"label\" data-type=\"vest\">Vest:</a> ";
  stack1 = depth0.vest;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(15, program15, data),fn:self.program(13, program13, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n  ";
  stack1 = depth0.vest;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(17, program17, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n<div class=\"four columns\">\n  <ul>\n    <li><span class=\"label\">Total cost:</span> $";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  </ul>\n  ";
  stack1 = depth0.isNew;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(21, program21, data),fn:self.program(19, program19, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</div>";
  return buffer;});
templates['_customization_modal_shirt.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  
  return "class=\"checked\"";}

function program3(depth0,data) {
  
  
  return "class=\"checked\"";}

function program5(depth0,data) {
  
  
  return "class=\"checked\"";}

function program7(depth0,data) {
  
  
  return "class=\"checked\"";}

function program9(depth0,data) {
  
  
  return "class=\"checked\"";}

function program11(depth0,data) {
  
  
  return "class=\"checked\"";}

function program13(depth0,data) {
  
  
  return "class=\"checked\"";}

function program15(depth0,data) {
  
  
  return "class=\"checked\"";}

function program17(depth0,data) {
  
  
  return "class=\"checked\"";}

function program19(depth0,data) {
  
  
  return "class=\"checked\"";}

function program21(depth0,data) {
  
  
  return "class=\"checked\"";}

function program23(depth0,data) {
  
  
  return "class=\"checked\"";}

function program25(depth0,data) {
  
  
  return "class=\"checked\"";}

function program27(depth0,data) {
  
  
  return "checked";}

function program29(depth0,data) {
  
  
  return "checked";}

function program31(depth0,data) {
  
  
  return "class=\"checked\"";}

function program33(depth0,data) {
  
  
  return "class=\"checked\"";}

function program35(depth0,data) {
  
  
  return "class=\"checked\"";}

function program37(depth0,data) {
  
  
  return "checked";}

function program39(depth0,data) {
  
  
  return "checked";}

function program41(depth0,data) {
  
  
  return "class=\"checked\"";}

function program43(depth0,data) {
  
  
  return "class=\"checked\"";}

function program45(depth0,data) {
  
  
  return "class=\"checked\"";}

function program47(depth0,data) {
  
  
  return "class=\"checked\"";}

function program49(depth0,data) {
  
  
  return "class=\"checked\"";}

function program51(depth0,data) {
  
  
  return "Yes";}

function program53(depth0,data) {
  
  
  return "No";}

function program55(depth0,data) {
  
  
  return "Yes";}

function program57(depth0,data) {
  
  
  return "No";}

function program59(depth0,data) {
  
  
  return "Yes";}

function program61(depth0,data) {
  
  
  return "No";}

function program63(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "Yes (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")";
  return buffer;}

function program65(depth0,data) {
  
  
  return "No";}

function program67(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n          <li><a href=\"#\" class=\"label\" data-type=\"vest_buttons\">Vest Buttons:</a> ";
  foundHelper = helpers.vest_buttons;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vest_buttons; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n          ";
  return buffer;}

function program69(depth0,data) {
  
  
  return "\n          <a href=\"#\" class=\"add-to-cart\"><img src=\"/assets/icons/cart.png\"></a>\n          <a href=\"#\" class=\"button add-to-cart\">Add To Cart</a>\n          ";}

function program71(depth0,data) {
  
  
  return "\n          <a href=\"#\" class=\"button save-changes\">Save Changes</a>\n          ";}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<h2>";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " <span class=\"divider\">//</span> Customize</h2>\n<div class=\"customizations\">\n  <ul class=\"progress-bar ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.category;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + "\">\n    <li data-type=\"collar\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, true, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"fit\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"pocket\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"monogram\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"checkout\"><img src=\"/assets/icons/star-no-stroke.png\"></li>\n  </ul>\n  <ul class=\"customization-list\">\n    <li class=\"customization-wrapper\" data-type=\"collar\">\n      <h3>Collar</h3>\n      <a href=\"#\" class=\"customization-option three\" data-option=\"standard\">\n        <h5>Standard</h5>\n        <img ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "standard", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)}) : helperMissing.call(depth0, "ifeq", stack1, "standard", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/shirts/collar-standard.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option three\" data-option=\"cutaway\">\n        <h5>Cutaway</h5>\n        <img ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "cutaway", {hash:{},inverse:self.noop,fn:self.program(3, program3, data)}) : helperMissing.call(depth0, "ifeq", stack1, "cutaway", {hash:{},inverse:self.noop,fn:self.program(3, program3, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/shirts/collar-cutaway.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option three\" data-option=\"straight\">\n        <h5>Straight</h5>\n        <img ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "straight", {hash:{},inverse:self.noop,fn:self.program(5, program5, data)}) : helperMissing.call(depth0, "ifeq", stack1, "straight", {hash:{},inverse:self.noop,fn:self.program(5, program5, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/shirts/collar-straight.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option three\" data-option=\"button-down\">\n        <h5>Button Down</h5>\n        <img ";
  stack1 = depth0.collar;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "button-down", {hash:{},inverse:self.noop,fn:self.program(7, program7, data)}) : helperMissing.call(depth0, "ifeq", stack1, "button-down", {hash:{},inverse:self.noop,fn:self.program(7, program7, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/shirts/collar-button-down.png\">\n      </a>\n      <p>The standard or straight collars are always a nice, clean TR-approved look. The cutaway collar is a solid\n        option for someone that really wants to emphasize a wide tie knot, such as a Windsor. Button-down collars tend\n        to be slightly more casual and can be a nice choice if you are not wearing the shirt with a suit.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"buttons\">\n      <h3>Buttons</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(9, program9, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(9, program9, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/buttons-one.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(11, program11, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(11, program11, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/buttons-two.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"3\">\n        <h5>Three</h5>\n        <img ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 3, {hash:{},inverse:self.noop,fn:self.program(13, program13, data)}) : helperMissing.call(depth0, "ifeq", stack1, 3, {hash:{},inverse:self.noop,fn:self.program(13, program13, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/buttons-three.png\">\n      </a>\n\n      <p>The modern standard and a fashionable choice is the two button suit. Two button suits fit more of a classic\n        style and look great on taller guys. A one button suit is a very stylish option for those who want to be\n        adventurous. TR tip: If you are going to add a vest, stick with the two button jacket.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"vents\">\n      <h3>Vents</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"0\">\n        <h5>None</h5>\n        <img ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(15, program15, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(15, program15, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vents-none.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(17, program17, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(17, program17, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vents-one.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(19, program19, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(19, program19, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vents-two.png\">\n      </a>\n\n      <p>Having two vents is the traditional, safe and stylish choice. One vent is a way to make your suit modern and\n        sleek without distracting from the excellent fit (we love the single vent). TR tip: If you are a shorter guy,\n        go ahead and get the double vent, the vertical vents help to draw the eye upward and elongate the body.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"pleats\">\n      <h3>Pleats</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"0\">\n        <h5>None</h5>\n        <img ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(21, program21, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(21, program21, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/pleats-none.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(23, program23, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(23, program23, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/pleats-one.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(25, program25, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(25, program25, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/pleats-two.png\">\n      </a>\n\n      <p>Pleats are typically associated with old-fashioned suits. If you are looking for a modern, trendier look, we\n        recommend going with no pleats and no cuffs on the pants.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"pant_cuffs\">\n      <h3>Cuffs</h3>\n      <a href=\"#\" class=\"customization-option\" data-option=\"false\">\n        <h5>None</h5>\n        <img src=\"/assets/customizations/suits/cuffs-no.png\" class=\"cuffs ";
  stack1 = depth0.pant_cuffs;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(27, program27, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(27, program27, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">\n\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option\" data-option=\"true\">\n        <h5>Cuffs</h5>\n        <img src=\"/assets/customizations/suits/cuffs-yes.png\" class=\"cuffs ";
  stack1 = depth0.pant_cuffs;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(29, program29, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(29, program29, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">\n      </a>\n\n      <p>Pant cuffs were a suit staple in previous decades, but unless you are going for an older, more classic look,\n        we recommend sticking with no pant cuffs. It keeps the suit lines clean and sharp, keeping those heads on a\n        swivel.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"fit\">\n      <h3>Fit</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"slim\">\n        <h5>Slim</h5>\n        <img ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(31, program31, data)}) : helperMissing.call(depth0, "ifeq", stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(31, program31, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/fit-slim.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"tailored\">\n        <h5>Tailored</h5>\n        <img ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "tailored", {hash:{},inverse:self.noop,fn:self.program(33, program33, data)}) : helperMissing.call(depth0, "ifeq", stack1, "tailored", {hash:{},inverse:self.noop,fn:self.program(33, program33, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/fit-tailored.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"normal\">\n        <h5>Normal</h5>\n        <img ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(35, program35, data)}) : helperMissing.call(depth0, "ifeq", stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(35, program35, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/fit-normal.png\">\n      </a>\n\n      <p>The tailored fit is guaranteed to look great on most guys. A regular fit is great for guys with a fuller\n        figure. And the slim fit is great for lean guys who want a very tight fitting suit and know they will not have\n        any weight changes in the future. TR tip: Regardless of the fit option, our suits are tailored to your\n        measurements, so slim or full-figured, your suit will look and feel great.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"lining\">\n      <h3>Lining</h3>\n\n      <div class=\"customization-option\">\n        <img src=\"/assets/customizations/suits/lining.png\" class=\"lining\">\n      </div>\n      <div class=\"customization-option linings\">\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"12345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"2312\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"23523\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"123213\"></a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"461\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"346\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"123531\"></a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"967\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"3463\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"1245745345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"345342\"></a>\n        </div>\n        <div class=\"twelve columns\">\n          <a href=\"#\" class=\"button advance-slide\">Select</a>\n        </div>\n      </div>\n      <p>The most common selection is matching lining, which works with the suit to bring out the fabrics natural\n        intrigue. Contrasting linings are a great choice if you want to add a little flash to your suit, making your\n        suit stand out. TR tip: A unique lining is a great way to make your suit stand out and really separates your\n        suit from the off-the-rack crowd; we recommend being bold.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"monogram\">\n      <h3>Monogram</h3>\n\n      <div href=\"#\" class=\"customization-option\">\n        <img src=\"/assets/customizations/suits/monogram.png\" class=\"monogram\">\n      </div>\n      <div class=\"customization-option\">\n        <p>Monogram (15 character max)</p>\n\n        <form id=\"monogram-form\">\n          <input type=\"text\" name=\"monogram\" maxlength=\"15\" value=\"";
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n          <input type=\"submit\" class=\"button\" value=\"Ok\">\n        </form>\n      </div>\n      <p>Monogramming can be up to 15 characters, usually used for your name (i.e. 'Richard Feynman' or 'R.P.F.' or\n        'R. Feynman'). It will show up on the inside of your jacket above the left breast pocket. Feel free to put\n        whatever you want here, just keep in mind that people will see it when you are showing off your envy-inducing\n        lining.</p>\n    </li>\n    <li class=\"customization-wrapper advanced\" data-type=\"advanced\">\n      <h3>Advanced</h3>\n\n      <div class=\"twelve columns\">\n        <ul>\n          <li><label><input type=\"checkbox\" class=\"advanced-checkbox\" name=\"bouttoniere\" ";
  stack1 = depth0.bouttoniere;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(37, program37, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ">Functional Bouttoniere</label></li>\n          <li><label><input type=\"checkbox\" class=\"advanced-checkbox\" name=\"pick_stitching\" ";
  stack1 = depth0.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(39, program39, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ">Pick Stitching</label></li>\n        </ul>\n        <a href=\"#\" class=\"advance-slide button\">Ok</a>\n      </div>\n      <p>Pick stitching really emphasizes the stitching on your suit making it clear that you went with a tailored\n        option. This is a fairly bold look, so we recommend opting out unless you are familiar with the look and know\n        you want it. The functional boutonniere is simply a sleeve that can be unbuttoned—it doesn’t make a huge\n        difference what you choose here.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"vest\">\n      <h3>Vest (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"true\">\n        <h5>Add Vest</h5>\n        <img ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(41, program41, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(41, program41, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-three.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"false\">\n        <h5>No Vest</h5>\n        <img ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(43, program43, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(43, program43, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-three.png\">\n      </a>\n\n      <p>Do you want to make your suit a three-piece? You can add a matching vest to your suit order for $79. A\n        three-piece suit is sure to draw looks and makes a bold statement that you are serious about your style game.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"vest_buttons\">\n      <div class=\"vest-overlay\" style=\"display: none;\">\n        <p>It looks like you haven't added a vest to your suit. If you'd like to add a vest, please go back to the previous\n          slide and select \"Add Vest\".</p>\n      </div>\n      <h3>Vest Buttons</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"3\">\n        <h5>Three Buttons</h5>\n        <img ";
  stack1 = depth0.customization;
  foundHelper = helpers.ifVest;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 3, {hash:{},inverse:self.noop,fn:self.program(45, program45, data)}) : helperMissing.call(depth0, "ifVest", stack1, 3, {hash:{},inverse:self.noop,fn:self.program(45, program45, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-three.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"4\">\n        <h5>Four Buttons</h5>\n        <img ";
  stack1 = depth0.customization;
  foundHelper = helpers.ifVest;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 4, {hash:{},inverse:self.noop,fn:self.program(47, program47, data)}) : helperMissing.call(depth0, "ifVest", stack1, 4, {hash:{},inverse:self.noop,fn:self.program(47, program47, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-four.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"5\">\n        <h5>Five Buttons</h5>\n        <img ";
  stack1 = depth0.customization;
  foundHelper = helpers.ifVest;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 5, {hash:{},inverse:self.noop,fn:self.program(49, program49, data)}) : helperMissing.call(depth0, "ifVest", stack1, 5, {hash:{},inverse:self.noop,fn:self.program(49, program49, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-five.png\">\n      </a>\n\n      <p>Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons!\n        Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest\n        buttons!</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"checkout\">\n      <h3>Checkout</h3>\n\n      <div class=\"customization-summary row\">\n        <ul class=\"four columns\">\n          <li><a href=\"#\" class=\"label\" data-type=\"lapel\">Lapel:</a> ";
  stack1 = depth0.lapel;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"buttons\">Buttons:</a> ";
  stack1 = depth0.buttons;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"vents\">Vents:</a> ";
  stack1 = depth0.vents;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"pleats\">Pleats:</a> ";
  stack1 = depth0.pleats;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"pant_cuffs\">Cuffs:</a> ";
  stack1 = depth0.pant_cuffs;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(53, program53, data),fn:self.program(51, program51, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n        </ul>\n        <ul class=\"four columns\">\n          <li><a href=\"#\" class=\"label\" data-type=\"lining\">Lining:</a> ";
  foundHelper = helpers.lining;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.lining; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"monogram\">Monogram:</a> ";
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"advanced\">Bouttoniere:</a> ";
  stack1 = depth0.bouttoniere;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(57, program57, data),fn:self.program(55, program55, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"advanced\">Pick Stitching:</a> ";
  stack1 = depth0.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(61, program61, data),fn:self.program(59, program59, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n          </li>\n          <li><a href=\"#\" class=\"label\" data-type=\"vest\">Vest:</a> ";
  stack1 = depth0.vest;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(65, program65, data),fn:self.program(63, program63, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          ";
  stack1 = depth0.vest;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(67, program67, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </ul>\n        <div class=\"four columns\">\n          <ul>\n            <li><span class=\"label\">Total cost:</span> $";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          </ul>\n          ";
  stack1 = depth0.isNew;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(71, program71, data),fn:self.program(69, program69, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </div>\n      </div>\n    </li>\n  </ul>\n</div>\n<div class=\"row\">\n  <div class=\"six columns\">\n    <a href=\"#\" class=\"button previous\" style=\"display: none;\">Previous</a>\n  </div>\n  <div class=\"six columns\">\n    <a href=\"#\" class=\"button next\">Next</a>\n  </div>\n</div>";
  return buffer;});
templates['_customization_modal_suit.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  
  return "class=\"checked\"";}

function program3(depth0,data) {
  
  
  return "class=\"checked\"";}

function program5(depth0,data) {
  
  
  return "class=\"checked\"";}

function program7(depth0,data) {
  
  
  return "class=\"checked\"";}

function program9(depth0,data) {
  
  
  return "class=\"checked\"";}

function program11(depth0,data) {
  
  
  return "class=\"checked\"";}

function program13(depth0,data) {
  
  
  return "class=\"checked\"";}

function program15(depth0,data) {
  
  
  return "class=\"checked\"";}

function program17(depth0,data) {
  
  
  return "class=\"checked\"";}

function program19(depth0,data) {
  
  
  return "class=\"checked\"";}

function program21(depth0,data) {
  
  
  return "class=\"checked\"";}

function program23(depth0,data) {
  
  
  return "class=\"checked\"";}

function program25(depth0,data) {
  
  
  return "checked";}

function program27(depth0,data) {
  
  
  return "checked";}

function program29(depth0,data) {
  
  
  return "class=\"checked\"";}

function program31(depth0,data) {
  
  
  return "class=\"checked\"";}

function program33(depth0,data) {
  
  
  return "class=\"checked\"";}

function program35(depth0,data) {
  
  
  return "checked";}

function program37(depth0,data) {
  
  
  return "checked";}

function program39(depth0,data) {
  
  
  return "class=\"checked\"";}

function program41(depth0,data) {
  
  
  return "class=\"checked\"";}

function program43(depth0,data) {
  
  
  return "class=\"checked\"";}

function program45(depth0,data) {
  
  
  return "class=\"checked\"";}

function program47(depth0,data) {
  
  
  return "class=\"checked\"";}

function program49(depth0,data) {
  
  
  return "Yes";}

function program51(depth0,data) {
  
  
  return "No";}

function program53(depth0,data) {
  
  
  return "Yes";}

function program55(depth0,data) {
  
  
  return "No";}

function program57(depth0,data) {
  
  
  return "Yes";}

function program59(depth0,data) {
  
  
  return "No";}

function program61(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "Yes (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")";
  return buffer;}

function program63(depth0,data) {
  
  
  return "No";}

function program65(depth0,data) {
  
  var buffer = "", stack1, foundHelper;
  buffer += "\n          <li><a href=\"#\" class=\"label\" data-type=\"vest_buttons\">Vest Buttons:</a> ";
  foundHelper = helpers.vest_buttons;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vest_buttons; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n          ";
  return buffer;}

function program67(depth0,data) {
  
  
  return "\n          <a href=\"#\" class=\"add-to-cart\"><img src=\"/assets/icons/cart-black.png\"></a>\n          <a href=\"#\" class=\"button add-to-cart\">Add To Cart</a>\n          ";}

function program69(depth0,data) {
  
  
  return "\n          <a href=\"#\" class=\"button save-changes\">Save Changes</a>\n          ";}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<h2>";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " <span class=\"divider\">//</span> Customize</h2>\n<div class=\"customizations\">\n  <ul class=\"progress-bar\">\n    <li data-type=\"lapel\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, true, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"buttons\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"vents\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"pleats\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"pant_cuffs\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"fit\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"lining\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"monogram\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"advanced\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"vest\">";
  stack1 = depth0.customization;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"vest_buttons\">";
  stack1 = depth0.vest;
  foundHelper = helpers.customizationHelper;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "customizationHelper", stack1, {hash:{}});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n    <li data-type=\"checkout\"><img src=\"/assets/icons/star-no-stroke.png\"></li>\n  </ul>\n  <ul class=\"customization-list\">\n    <li class=\"customization-wrapper\" data-type=\"lapel\">\n      <h3>Lapel</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"notch\">\n        <h5>Notch</h5>\n        <img ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "notch", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)}) : helperMissing.call(depth0, "ifeq", stack1, "notch", {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/lapel-notch-black.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"peak\">\n        <h5>Peak</h5>\n        <img ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "peak", {hash:{},inverse:self.noop,fn:self.program(3, program3, data)}) : helperMissing.call(depth0, "ifeq", stack1, "peak", {hash:{},inverse:self.noop,fn:self.program(3, program3, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/lapel-peak-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"narrow\">\n        <h5>Narrow</h5>\n        <img ";
  stack1 = depth0.lapel;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "narrow", {hash:{},inverse:self.noop,fn:self.program(5, program5, data)}) : helperMissing.call(depth0, "ifeq", stack1, "narrow", {hash:{},inverse:self.noop,fn:self.program(5, program5, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/lapel-narrow-black.png\">\n      </a>\n      <p>Notch lapels are the most widely used lapels and are a safe and stylish choice for any suit. Peak lapels add a\n        little pizazz for those who want to stand out. TR tip: If you are unsure, go with the notch lapel, you don’t\n        necessarily want anything to distract from the perfect fit of your tailored suit.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"buttons\">\n      <h3>Buttons</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(7, program7, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(7, program7, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/buttons-one-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(9, program9, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(9, program9, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/buttons-two-black.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"3\">\n        <h5>Three</h5>\n        <img ";
  stack1 = depth0.buttons;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 3, {hash:{},inverse:self.noop,fn:self.program(11, program11, data)}) : helperMissing.call(depth0, "ifeq", stack1, 3, {hash:{},inverse:self.noop,fn:self.program(11, program11, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/buttons-three-black.png\">\n      </a>\n      <p>The modern standard and a fashionable choice is the two button suit. Two button suits fit more of a classic\n        style and look great on taller guys. A one button suit is a very stylish option for those who want to be\n        adventurous. TR tip: If you are going to add a vest, stick with the two button jacket.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"vents\">\n      <h3>Vents</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"0\">\n        <h5>None</h5>\n        <img ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(13, program13, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(13, program13, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vents-none-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(15, program15, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(15, program15, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vents-one-black.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img ";
  stack1 = depth0.vents;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(17, program17, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(17, program17, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vents-two-black.png\">\n      </a>\n      <p>Having two vents is the traditional, safe and stylish choice. One vent is a way to make your suit modern and\n        sleek without distracting from the excellent fit (we love the single vent). TR tip: If you are a shorter guy,\n        go ahead and get the double vent, the vertical vents help to draw the eye upward and elongate the body.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"pleats\">\n      <h3>Pleats</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"0\">\n        <h5>None</h5>\n        <img ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 0, {hash:{},inverse:self.noop,fn:self.program(19, program19, data)}) : helperMissing.call(depth0, "ifeq", stack1, 0, {hash:{},inverse:self.noop,fn:self.program(19, program19, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/pleats-none-black.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 1, {hash:{},inverse:self.noop,fn:self.program(21, program21, data)}) : helperMissing.call(depth0, "ifeq", stack1, 1, {hash:{},inverse:self.noop,fn:self.program(21, program21, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/pleats-one-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img ";
  stack1 = depth0.pleats;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 2, {hash:{},inverse:self.noop,fn:self.program(23, program23, data)}) : helperMissing.call(depth0, "ifeq", stack1, 2, {hash:{},inverse:self.noop,fn:self.program(23, program23, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/pleats-two-black.png\">\n      </a>\n      <p>Pleats are typically associated with old-fashioned suits. If you are looking for a modern, trendier look, we\n        recommend going with no pleats and no cuffs on the pants.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"pant_cuffs\">\n      <h3>Cuffs</h3>\n      <a href=\"#\" class=\"customization-option\" data-option=\"false\">\n        <h5>None</h5>\n        <img src=\"/assets/customizations/suits/cuffs-no-black.png\" class=\"cuffs ";
  stack1 = depth0.pant_cuffs;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(25, program25, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(25, program25, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option\" data-option=\"true\">\n        <h5>Cuffs</h5>\n        <img src=\"/assets/customizations/suits/cuffs-yes-black.png\" class=\"cuffs ";
  stack1 = depth0.pant_cuffs;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(27, program27, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(27, program27, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">\n      </a>\n      <p>Pant cuffs were a suit staple in previous decades, but unless you are going for an older, more classic look,\n        we recommend sticking with no pant cuffs. It keeps the suit lines clean and sharp, keeping those heads on a\n        swivel.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"fit\">\n      <h3>Fit</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"slim\">\n        <h5>Slim</h5>\n        <img ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(29, program29, data)}) : helperMissing.call(depth0, "ifeq", stack1, "slim", {hash:{},inverse:self.noop,fn:self.program(29, program29, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/fit-slim-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"tailored\">\n        <h5>Tailored</h5>\n        <img ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "tailored", {hash:{},inverse:self.noop,fn:self.program(31, program31, data)}) : helperMissing.call(depth0, "ifeq", stack1, "tailored", {hash:{},inverse:self.noop,fn:self.program(31, program31, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/fit-tailored-black.png\">\n        <div class=\"recommended\">\n          <img src=\"/assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"normal\">\n        <h5>Normal</h5>\n        <img ";
  stack1 = depth0.fit;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(33, program33, data)}) : helperMissing.call(depth0, "ifeq", stack1, "normal", {hash:{},inverse:self.noop,fn:self.program(33, program33, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/fit-normal-black.png\">\n      </a>\n      <p>The tailored fit is guaranteed to look great on most guys. A regular fit is great for guys with a fuller\n        figure. And the slim fit is great for lean guys who want a very tight fitting suit and know they will not have\n        any weight changes in the future. TR tip: Regardless of the fit option, our suits are tailored to your\n        measurements, so slim or full-figured, your suit will look and feel great.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"lining\">\n      <h3>Lining</h3>\n      <div class=\"customization-option\">\n        <img src=\"/assets/customizations/suits/lining-black.png\" class=\"lining\">\n      </div>\n      <div class=\"customization-option linings\">\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"12345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"2312\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"23523\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"123213\"></a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"461\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"346\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"123531\"></a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"967\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"3463\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"1245745345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"345342\"></a>\n        </div>\n        <div class=\"twelve columns\">\n          <a href=\"#\" class=\"button advance-slide\">Select</a>\n        </div>\n      </div>\n      <p>The most common selection is matching lining, which works with the suit to bring out the fabrics natural\n        intrigue. Contrasting linings are a great choice if you want to add a little flash to your suit, making your\n        suit stand out. TR tip: A unique lining is a great way to make your suit stand out and really separates your\n        suit from the off-the-rack crowd; we recommend being bold.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"monogram\">\n      <h3>Monogram</h3>\n      <div href=\"#\" class=\"customization-option\">\n        <img src=\"/assets/customizations/suits/monogram-black.png\" class=\"monogram\">\n      </div>\n      <div class=\"customization-option\">\n        <p>Monogram (15 character max)</p>\n        <form id=\"monogram-form\">\n          <input type=\"text\" name=\"monogram\" maxlength=\"15\" value=\"";
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n          <input type=\"submit\" class=\"button\" value=\"Ok\">\n        </form>\n      </div>\n      <p>Monogramming can be up to 15 characters, usually used for your name (i.e. 'Richard Feynman' or 'R.P.F.' or\n        'R. Feynman'). It will show up on the inside of your jacket above the left breast pocket. Feel free to put\n        whatever you want here, just keep in mind that people will see it when you are showing off your envy-inducing\n        lining.</p>\n    </li>\n    <li class=\"customization-wrapper advanced\" data-type=\"advanced\">\n      <h3>Advanced</h3>\n      <div class=\"twelve columns\">\n        <ul>\n          <li><label><input type=\"checkbox\" class=\"advanced-checkbox\" name=\"bouttoniere\" ";
  stack1 = depth0.bouttoniere;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(35, program35, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ">Functional Bouttoniere</label></li>\n          <li><label><input type=\"checkbox\" class=\"advanced-checkbox\" name=\"pick_stitching\" ";
  stack1 = depth0.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(37, program37, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ">Pick Stitching</label></li>\n        </ul>\n        <a href=\"#\" class=\"advance-slide button\">Ok</a>\n      </div>\n      <p>Pick stitching really emphasizes the stitching on your suit making it clear that you went with a tailored\n        option. This is a fairly bold look, so we recommend opting out unless you are familiar with the look and know\n        you want it. The functional boutonniere is simply a sleeve that can be unbuttoned—it doesn’t make a huge\n        difference what you choose here.</p>\n    </li>\n    <li class=\"customization-wrapper two-item\" data-type=\"vest\">\n      <h3>Vest (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"true\">\n        <h5>Add Vest</h5>\n        <img ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, true, {hash:{},inverse:self.noop,fn:self.program(39, program39, data)}) : helperMissing.call(depth0, "ifeq", stack1, true, {hash:{},inverse:self.noop,fn:self.program(39, program39, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-three-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"false\">\n        <h5>No Vest</h5>\n        <img ";
  stack1 = depth0.vest;
  foundHelper = helpers.ifeq;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, false, {hash:{},inverse:self.noop,fn:self.program(41, program41, data)}) : helperMissing.call(depth0, "ifeq", stack1, false, {hash:{},inverse:self.noop,fn:self.program(41, program41, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-three-black.png\">\n      </a>\n      <p>Do you want to make your suit a three-piece? You can add a matching vest to your suit order for $79. A\n        three-piece suit is sure to draw looks and makes a bold statement that you are serious about your style game.</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"vest_buttons\">\n      <div class=\"vest-overlay\" style=\"display: none;\">\n        <p>It looks like you haven't added a vest to your suit. If you'd like to add a vest, please go back to the previous\n          slide and select \"Add Vest\".</p>\n      </div>\n      <h3>Vest Buttons</h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"3\">\n        <h5>Three Buttons</h5>\n        <img ";
  stack1 = depth0.customization;
  foundHelper = helpers.ifVest;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 3, {hash:{},inverse:self.noop,fn:self.program(43, program43, data)}) : helperMissing.call(depth0, "ifVest", stack1, 3, {hash:{},inverse:self.noop,fn:self.program(43, program43, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-three-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"4\">\n        <h5>Four Buttons</h5>\n        <img ";
  stack1 = depth0.customization;
  foundHelper = helpers.ifVest;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 4, {hash:{},inverse:self.noop,fn:self.program(45, program45, data)}) : helperMissing.call(depth0, "ifVest", stack1, 4, {hash:{},inverse:self.noop,fn:self.program(45, program45, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-four-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"5\">\n        <h5>Five Buttons</h5>\n        <img ";
  stack1 = depth0.customization;
  foundHelper = helpers.ifVest;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, 5, {hash:{},inverse:self.noop,fn:self.program(47, program47, data)}) : helperMissing.call(depth0, "ifVest", stack1, 5, {hash:{},inverse:self.noop,fn:self.program(47, program47, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += " src=\"/assets/customizations/suits/vest-five-black.png\">\n      </a>\n      <p>Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons!\n        Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest\n        buttons!</p>\n    </li>\n    <li class=\"customization-wrapper\" data-type=\"checkout\">\n      <h3>Checkout</h3>\n      <div class=\"customization-summary row\">\n        <ul class=\"four columns\">\n          <li><a href=\"#\" class=\"label\" data-type=\"lapel\">Lapel:</a> ";
  stack1 = depth0.lapel;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"buttons\">Buttons:</a> ";
  stack1 = depth0.buttons;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"vents\">Vents:</a> ";
  stack1 = depth0.vents;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"pleats\">Pleats:</a> ";
  stack1 = depth0.pleats;
  foundHelper = helpers.numberToString;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "numberToString", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"pant_cuffs\">Cuffs:</a> ";
  stack1 = depth0.pant_cuffs;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(51, program51, data),fn:self.program(49, program49, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"fit\">Fit:</a> ";
  stack1 = depth0.fit;
  foundHelper = helpers.uppercaseFirst;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "uppercaseFirst", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n        </ul>\n        <ul class=\"four columns\">\n          <li><a href=\"#\" class=\"label\" data-type=\"lining\">Lining:</a> ";
  foundHelper = helpers.lining;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.lining; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"monogram\">Monogram:</a> ";
  foundHelper = helpers.monogram;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.monogram; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"advanced\">Bouttoniere:</a> ";
  stack1 = depth0.bouttoniere;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(55, program55, data),fn:self.program(53, program53, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"advanced\">Pick Stitching:</a> ";
  stack1 = depth0.pick_stitching;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(59, program59, data),fn:self.program(57, program57, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          <li><a href=\"#\" class=\"label\" data-type=\"vest\">Vest:</a> ";
  stack1 = depth0.vest;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(63, program63, data),fn:self.program(61, program61, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</li>\n          ";
  stack1 = depth0.vest;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(65, program65, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </ul>\n        <div class=\"four columns\">\n          <ul>\n            <li><span class=\"label\">Total cost:</span> $";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n          </ul>\n          ";
  stack1 = depth0.isNew;
  stack1 = helpers['if'].call(depth0, stack1, {hash:{},inverse:self.program(69, program69, data),fn:self.program(67, program67, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </div>\n      </div>\n    </li>\n  </ul>\n</div>\n<div class=\"row\">\n  <div class=\"six columns\">\n    <a href=\"#\" class=\"button previous\" style=\"display: none;\">Previous</a>\n  </div>\n  <div class=\"six columns\">\n    <a href=\"#\" class=\"button next\">Next</a>\n  </div>\n</div>";
  return buffer;});
templates['_dialog_modal.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"twelve columns\">\n  <p>";
  foundHelper = helpers.text;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.text; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</p>\n</div>\n\n<div class=\"six columns\">\n  <a href=\"#\" class=\"confirm button\">";
  foundHelper = helpers.confirmText;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.confirmText; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</a>\n</div>\n<div class=\"six columns\">\n  <a href=\"#\" class=\"cancel button\">";
  foundHelper = helpers.cancelText;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.cancelText; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</a>\n</div>\n";
  return buffer;});
templates['_measurement_summary.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"twelve columns\">\n  <p>Please read over your measurements one last time and ensure that they are correct. If they look good, click\n    \"Accept\" to continue.</p>\n</div>\n\n<div class=\"four columns\">\n  <ul>\n    <li data-measurement=\"neck\"><span class=\"label\">Neck:</span> ";
  foundHelper = helpers.neck;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.neck; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"chest\"><span class=\"label\">Chest:</span> ";
  foundHelper = helpers.chest;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.chest; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"front\"><span class=\"label\">Front:</span> ";
  foundHelper = helpers.front;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.front; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"stomach\"><span class=\"label\">Stomach:</span> ";
  foundHelper = helpers.stomach;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.stomach; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"waist\"><span class=\"label\">Waist:</span> ";
  foundHelper = helpers.waist;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.waist; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n  </ul>\n</div>\n\n<div class=\"four columns\">\n  <ul>\n    <li data-measurement=\"hips\"><span class=\"label\">Hips:</span> ";
  foundHelper = helpers.hips;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.hips; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"full_shoulders\"><span class=\"label\">Full Shoulders:</span> ";
  foundHelper = helpers.full_shoulders;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.full_shoulders; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"back\"><span class=\"label\">Back:</span> ";
  foundHelper = helpers.back;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.back; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"arm_length\"><span class=\"label\">Arm Length:</span> ";
  foundHelper = helpers.arm_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.arm_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"bicep\"><span class=\"label\">Bicep:</span> ";
  foundHelper = helpers.bicep;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.bicep; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n  </ul>\n</div>\n\n<div class=\"four columns\">\n  <ul>\n    <li data-measurement=\"wrist\"><span class=\"label\">Wrist:</span> ";
  foundHelper = helpers.wrist;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.wrist; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"jacket_length\"><span class=\"label\">Jacket Length:</span> ";
  foundHelper = helpers.jacket_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.jacket_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"crotch\"><span class=\"label\">Crotch:</span> ";
  foundHelper = helpers.crotch;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.crotch; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"thigh\"><span class=\"label\">Thigh:</span> ";
  foundHelper = helpers.thigh;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.thigh; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n    <li data-measurement=\"pant_length\"><span class=\"label\">Pant Length:</span> ";
  foundHelper = helpers.pant_length;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.pant_length; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"</li>\n  </ul>\n</div>";
  return buffer;});
templates['_product.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing;


  buffer += "<a href=\"#\"><img src=\"/assets/";
  foundHelper = helpers.image_large_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_large_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a>\n<div class=\"product-info-wrapper\">\n  <div class=\"product-info\">\n    <div class=\"product-name\">\n      <a href=\"#\">";
  foundHelper = helpers.name;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "<span class=\"divider\"> // </span><span class=\"dollar\">$</span>";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</a>\n    </div>\n    <a href=\"#\" class=\"customize\">Click To View</a>\n  </div>\n</div>";
  return buffer;});
templates['_product_modal.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing;


  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<div class=\"row\">\n  <h2 class=\"eight columns\">";
  foundHelper = helpers.name;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "<span class=\"divider\">&nbsp;//&nbsp;</span>$";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</h2>\n</div>\n<div class=\"row\">\n  <div class=\"five columns preview-wrapper\">\n    <ul class=\"modal-suit-preview three columns\">\n      <li><a href=\"#\"><img src=\"/assets/";
  foundHelper = helpers.image_small_1_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_1_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n      <li><a href=\"#\"><img src=\"/assets/";
  foundHelper = helpers.image_small_2_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_2_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n      <li><a href=\"#\"><img src=\"/assets/";
  foundHelper = helpers.image_small_3_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_3_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n      <li><a href=\"#\"><img src=\"/assets/";
  foundHelper = helpers.image_small_4_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_4_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n    </ul>\n    <div class=\"magnify nine columns\">\n      <div class=\"magnify-large\"></div>\n      <img class=\"main magnify-small\" src=\"/assets/";
  foundHelper = helpers.image_large_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_large_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n    </div>\n  </div>\n  <div class=\"seven columns\">\n    <p class=\"blurb\">";
  foundHelper = helpers.description;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.description; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</p>\n    <a href=\"#\" class=\"customize button large full-width\">Click To Customize</a>\n  </div>\n</div>\n";
  return buffer;});
})();