(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['_add_success_modal.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers; partials = partials || Handlebars.partials;
  var buffer = "", stack1, self=this, functionType="function", escapeExpression=this.escapeExpression;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    ";
  stack1 = depth0;
  stack1 = self.invokePartial(partials.product, 'product', stack1, helpers, partials);;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n  ";
  return buffer;}

  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n\n<h3>The ";
  stack1 = depth0.product;
  stack1 = stack1 == null || stack1 === false ? stack1 : stack1.name;
  stack1 = typeof stack1 === functionType ? stack1() : stack1;
  buffer += escapeExpression(stack1) + " has been added to your shopping cart.</h3>\n\n<div class=\"six columns button-column\">\n  <a href=\"#\" class=\"button\">Proceed To Checkout</a>\n</div>\n<div class=\"six columns button-column\">\n  <a href=\"#\" class=\"button keep-shopping\">Keep Shopping</a>\n</div>\n\n<h4>Other styles you might also like:</h4>\n\n<div class=\"suits-wrapper\">\n  ";
  stack1 = depth0.suggestedProducts;
  stack1 = helpers.each.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</div>\n\n";
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
  buffer += "\n    <li><a href=\"#\" class=\"label\" data-type=\"vest_buttons\">Vest Buttons:</a> ";
  foundHelper = helpers.vest_buttons;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vest_buttons; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</li>\n  ";
  return buffer;}

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
  buffer += escapeExpression(stack1) + "</li>\n</ul>\n\n<ul class=\"four columns\">\n  <li><a href=\"#\" class=\"label\" data-type=\"lining\">Lining:</a> ";
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
  buffer += "\n</ul>\n\n<div class=\"four columns\">\n  <ul>\n    <li><span class=\"label\">Total cost:</span> $";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</li>\n  </ul>\n  <img src=\"assets/icons/cart-black.png\">\n  <a href=\"#\" href=\"#\" class=\"button add-to-cart\">Add To Cart</a>\n</div>";
  return buffer;});
templates['_product.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"product-wrapper three columns\" data-id=\"";
  foundHelper = helpers.id;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n  <a href=\"#\"><img src=\"assets/";
  foundHelper = helpers.image_large_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_large_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a>\n  <div class=\"product-info-wrapper\">\n    <div class=\"product-info\">\n      <div class=\"product-name\"><a href=\"#\">";
  foundHelper = helpers.name;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</a></div>\n      <a href=\"#\" class=\"customize\">Click To Customize</a>\n    </div>\n    <div class=\"product-price\">\n      <div class=\"product-price-text-wrapper\">\n        <span class=\"dollar\">$</span><span class=\"price\">";
  foundHelper = helpers.price;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.price; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</span>\n      </div>\n    </div>\n  </div>\n</div>";
  return buffer;});
templates['_product_modal.tmpl'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing;


  buffer += "<a class=\"close-reveal-modal\">&#215;</a>\n<h2>";
  foundHelper = helpers.name;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "<span class=\"divider\">&nbsp;//&nbsp;</span>$";
  stack1 = depth0.price;
  foundHelper = helpers.decimalToInteger;
  stack1 = foundHelper ? foundHelper.call(depth0, stack1, {hash:{}}) : helperMissing.call(depth0, "decimalToInteger", stack1, {hash:{}});
  buffer += escapeExpression(stack1) + "</h2>\n<div class=\"five columns preview-wrapper\">\n  <ul class=\"modal-suit-preview three columns\">\n    <li><a href=\"#\"><img src=\"assets/";
  foundHelper = helpers.image_small_1_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_1_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n    <li><a href=\"#\"><img src=\"assets/";
  foundHelper = helpers.image_small_2_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_2_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n    <li><a href=\"#\"><img src=\"assets/";
  foundHelper = helpers.image_small_3_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_3_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n    <li><a href=\"#\"><img src=\"assets/";
  foundHelper = helpers.image_small_4_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_small_4_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\"></a></li>\n  </ul>\n  <div class=\"magnify nine columns\">\n    <div class=\"large\"></div>\n    <img class=\"main small\" src=\"assets/";
  foundHelper = helpers.image_large_url;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.image_large_url; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "\">\n  </div>\n</div>\n<div class=\"seven columns\">\n  <p class=\"blurb\">";
  foundHelper = helpers.description;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.description; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + "</p>\n  <div class=\"customizations\">\n    <h3 class=\"customize\">Customize</h3>\n    <ul class=\"chevrons\">\n      <li data-type=\"lapel\">\n        <a href=\"#\"><img class=\"selected\" src=\"assets/icons/chevron-selected.png\"></a>\n      </li>\n      <li data-type=\"buttons\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"vents\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"pleats\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"pant_cuffs\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"fit\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"lining\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"monogram\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"advanced\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"vest\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"vest_buttons\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n      <li data-type=\"checkout\">\n        <a href=\"#\"><img src=\"assets/icons/chevron.png\"></a>\n      </li>\n    </ul>\n    <div class=\"customization-wrapper\" data-type=\"lapel\">\n      <h3>Lapel<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"notch\">\n        <h5>Notch</h5>\n        <img src=\"assets/customizations/lapel-notch-black.png\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"peak\">\n        <h5>Peak</h5>\n        <img src=\"assets/customizations/lapel-peak-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"narrow\">\n        <h5>Narrow</h5>\n        <img src=\"assets/customizations/lapel-narrow-black.png\">\n      </a>\n      <p>Notch lapels are the most widely used lapels and are a safe and stylish choice for any suit. Peak lapels add a\n        little pizazz for those who want to stand out. TR tip: If you are unsure, go with the notch lapel, you don’t\n        necessarily want anything to distract from the perfect fit of your tailored suit.</p>\n    </div>\n    <div class=\"customization-wrapper\" data-type=\"buttons\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Buttons<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img src=\"assets/customizations/buttons-one-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img src=\"assets/customizations/buttons-two-black.png\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"3\">\n        <h5>Three</h5>\n        <img src=\"assets/customizations/buttons-three-black.png\">\n      </a>\n      <p>The modern standard and a fashionable choice is the two button suit. Two button suits fit more of a classic\n        style and look great on taller guys. A one button suit is a very stylish option for those who want to be\n        adventurous. TR tip: If you are going to add a vest, stick with the two button jacket.</p>\n    </div>\n    <div class=\"customization-wrapper\" data-type=\"vents\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Vents<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"0\">\n        <h5>None</h5>\n        <img src=\"assets/customizations/vents-none-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img src=\"assets/customizations/vents-one-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img src=\"assets/customizations/vents-two-black.png\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <p>Having two vents is the traditional, safe and stylish choice. One vent is a way to make your suit modern and\n        sleek without distracting from the excellent fit (we love the single vent). TR tip: If you are a shorter guy,\n        go ahead and get the double vent, the vertical vents help to draw the eye upward and elongate the body.</p>\n    </div>\n    <div class=\"customization-wrapper\" data-type=\"pleats\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Pleats<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"0\">\n        <h5>None</h5>\n        <img src=\"assets/customizations/pleats-none-black.png\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"1\">\n        <h5>One</h5>\n        <img src=\"assets/customizations/pleats-one-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"2\">\n        <h5>Two</h5>\n        <img src=\"assets/customizations/pleats-two-black.png\">\n      </a>\n      <p>Pleats are typically associated with old-fashioned suits. If you are looking for a modern, trendier look, we\n        recommend going with no pleats and no cuffs on the pants.</p>\n    </div>\n    <div class=\"customization-wrapper two-item\" data-type=\"pant_cuffs\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Cuffs<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option\" data-option=\"false\">\n        <h5>None</h5>\n        <img src=\"assets/customizations/cuffs-no-black.png\" class=\"cuffs\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option\" data-option=\"true\">\n        <h5>Cuffs</h5>\n        <img src=\"assets/customizations/cuffs-yes-black.png\" class=\"cuffs\">\n      </a>\n      <p>Pant cuffs were a suit staple in previous decades, but unless you are going for an older, more classic look,\n        we recommend sticking with no pant cuffs. It keeps the suit lines clean and sharp, keeping those heads on a\n        swivel.</p>\n    </div>\n    <div class=\"customization-wrapper\" data-type=\"fit\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Fit<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"slim\">\n        <h5>Slim</h5>\n        <img src=\"assets/customizations/fit-slim-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"tailored\">\n        <h5>Tailored</h5>\n        <img src=\"assets/customizations/fit-tailored-black.png\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"normal\">\n        <h5>Normal</h5>\n        <img src=\"assets/customizations/fit-normal-black.png\">\n      </a>\n      <p>The tailored fit is guaranteed to look great on most guys. A regular fit is great for guys with a fuller\n        figure. And the slim fit is great for lean guys who want a very tight fitting suit and know they will not have\n        any weight changes in the future. TR tip: Regardless of the fit option, our suits are tailored to your\n        measurements, so slim or full-figured, your suit will look and feel great.</p>\n    </div>\n    <div class=\"customization-wrapper two-item\" data-type=\"lining\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Lining<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <div class=\"customization-option\">\n        <img src=\"assets/customizations/lining-black.png\" class=\"lining\">\n      </div>\n      <div class=\"customization-option linings\">\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"12345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"2312\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"23523\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"123213\"></a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"461\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"346\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"123531\"></a>\n        </div>\n        <div class=\"four columns\">\n          <a href=\"#\" class=\"lining-option\" data-id=\"967\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"3463\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"1245745345\"></a>\n          <a href=\"#\" class=\"lining-option\" data-id=\"345342\"></a>\n        </div>\n      </div>\n      <p>The most common selection is matching lining, which works with the suit to bring out the fabrics natural\n        intrigue. Contrasting linings are a great choice if you want to add a little flash to your suit, making your\n        suit stand out. TR tip: A unique lining is a great way to make your suit stand out and really separates your\n        suit from the off-the-rack crowd; we recommend being bold.</p>\n    </div>\n    <div class=\"customization-wrapper two-item\" data-type=\"monogram\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Monogram<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <div href=\"#\" class=\"customization-option\">\n        <img src=\"assets/customizations/monogram-black.png\" class=\"monogram\">\n      </div>\n      <div class=\"customization-option\">\n        <p>Monogram (15 character max)</p>\n        <input type=\"text\" name=\"monogram\" maxlength=\"15\">\n      </div>\n      <p>Monogramming can be up to 15 characters, usually used for your name (i.e. 'Richard Feynman' or 'R.P.F.' or\n        'R. Feynman'). It will show up on the inside of your jacket above the left breast pocket. Feel free to put\n        whatever you want here, just keep in mind that people will see it when you are showing off your envy-inducing\n        lining.</p>\n    </div>\n    <div class=\"customization-wrapper two-item\" data-type=\"advanced\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Advanced<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option\" data-option=\"bouttoniere\">\n        <h5>Functional Bouttoniere (Y/N)?</h5>\n        <img src=\"assets/customizations/bouttoniere-black.png\">\n        <div class=\"recommended\">\n          <img src=\"assets/logos/logo-stitch.png\" class=\"shield\"><span>Recommended</span>\n        </div>\n      </a>\n      <a href=\"#\" class=\"customization-option\" data-option=\"pick_stitching\">\n        <h5>Pick Stitching (Y/N)?</h5>\n        <img src=\"assets/customizations/pick-stitching-black.png\">\n      </a>\n      <p>Pick stitching really emphasizes the stitching on your suit making it clear that you went with a tailored\n        option. This is a fairly bold look, so we recommend opting out unless you are familiar with the look and know\n        you want it. The functional boutonniere is simply a sleeve that can be unbuttoned—it doesn’t make a huge\n        difference what you choose here.</p>\n    </div>\n    <div class=\"customization-wrapper two-item\" data-type=\"vest\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Vest (+$";
  foundHelper = helpers.vestPrice;
  if (foundHelper) { stack1 = foundHelper.call(depth0, {hash:{}}); }
  else { stack1 = depth0.vestPrice; stack1 = typeof stack1 === functionType ? stack1() : stack1; }
  buffer += escapeExpression(stack1) + ")<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"true\">\n        <h5>Add Vest</h5>\n        <img src=\"assets/customizations/vest-three-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"false\">\n        <h5>No Vest</h5>\n        <img src=\"assets/customizations/vest-three-black.png\">\n      </a>\n      <p>Do you want to make your suit a three-piece? You can add a matching vest to your suit order for $79. A\n        three-piece suit is sure to draw looks and makes a bold statement that you are serious about your style game.</p>\n    </div>\n    <div class=\"customization-wrapper\" data-type=\"vest_buttons\" style=\"display: none;\">\n      <div class=\"vest-overlay\" style=\"display: none;\">\n        <p>It looks like you haven't added a vest to your suit. If you'd like to add a vest, please go back to the previous\n          slide and select \"Add Vest\".</p>\n      </div>\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Vest Buttons<a href=\"#\" class=\"right\" title=\"Next customization\"></a></h3>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"3\">\n        <h5>Three Buttons</h5>\n        <img src=\"assets/customizations/vest-three-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"4\">\n        <h5>Four Buttons</h5>\n        <img src=\"assets/customizations/vest-four-black.png\">\n      </a>\n      <a href=\"#\" class=\"customization-option four\" data-option=\"5\">\n        <h5>Five Buttons</h5>\n        <img src=\"assets/customizations/vest-five-black.png\">\n      </a>\n      <p>Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons!\n        Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest buttons! Vest\n        buttons!</p>\n    </div>\n    <div class=\"customization-wrapper\" data-type=\"checkout\" style=\"display: none;\">\n      <h3><a href=\"#\" class=\"left\" title=\"Previous customization\"></a>Checkout</h3>\n      <!--<h5>Your customizations:</h5>-->\n      <div class=\"customization-summary\"></div>\n    </div>\n  </div>\n</div>";
  return buffer;});
})();