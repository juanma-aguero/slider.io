
var expect = require('expect.js'),
	Browser = require('zombie'),
	browser = new Browser();

describe('#configs the slider', function(){
	var newSlider = require('../../mocks/newSlider.js').slider;

	beforeEach(function(done){
		 browser.visit("http://localhost:3000/slider/" + newSlider.name + "/editor", function () {
      expect(browser.success);
      
      browser
				.fill("passcode", newSlider.passcode)
				.pressButton("OK", function(){
					done();
				});
    });
	});
		
	
	describe('#visualizes the config panel', function(){
	
		it('should be able to visualize main slider values', function(){
			var cfgPanel = browser.queryAll('#mainConfigs');
			expect(cfgPanel.length).to.equal(1);
			
			var txtIniIndex = browser.queryAll('#txtInitIndex');
			expect(txtIniIndex.length).to.equal(1);
			expect(browser.evaluate("$('#txtInitIndex').val();")).to.eql(0);
			
			var txtTitle = browser.queryAll('#txtTitle');
			expect(txtTitle.length).to.equal(1);
			expect(browser.evaluate("$('#txtTitle').val();")).to.eql(newSlider.title);
		
			var styleCtns = browser.queryAll('.style-container');
			expect(styleCtns.length).to.equal(4);
		});
		
		it('should only be able to visualize defaults background for Main Slider', function(){
			
			expect(browser.evaluate("$('.style-container').eq(1).children('div.font').length;")).to.eql(0);
			expect(browser.evaluate("$('.style-container').eq(1).children('div.border').length;")).to.eql(0);
			expect(browser.evaluate("$('.style-container').eq(1).children('div.background').length;")).to.eql(1);
		});
		
		it('should be able to visualize defaults fonts, borders & backgrounds', function(){
			
			//All
			expect(browser.evaluate("$('.style-container').eq(2).children('div').length;")).to.eql(3);
			//Chapter
			expect(browser.evaluate("$('.style-container').eq(3).children('div').length;")).to.eql(3);
			
			
			function getSelector(idx, type, selector){
				return "$('.style-container').eq(" + idx + ").find('div." + type + " " + selector + "').val().toLowerCase();";
			}
			
			//Main background
			expect(browser.evaluate(getSelector(1, 'background', '.color-field'))).to.eql('#ffffff');
			
			//All
			expect(browser.evaluate(getSelector(2, 'background', '.color-field'))).to.eql('#dedede');
			
			expect(browser.evaluate(getSelector(2, 'font', '.color-field'))).to.eql('#454545');
			expect(browser.evaluate(getSelector(2, 'font', '.fontName-field'))).to.eql('arial');
			
			expect(browser.evaluate(getSelector(2, 'border', '.color-field'))).to.eql('#000000');
			expect(browser.evaluate(getSelector(2, 'border', '.radius-field'))).to.eql(0);
			expect(browser.evaluate(getSelector(2, 'border', '.size-field'))).to.eql(0);
			
			//Chapter
			expect(browser.evaluate(getSelector(3, 'background', '.color-field'))).to.eql('#c8d8b6');
			
			expect(browser.evaluate(getSelector(3, 'font', '.color-field'))).to.eql('#454545');
			expect(browser.evaluate(getSelector(3, 'font', '.fontName-field'))).to.eql('arial');
			
			expect(browser.evaluate(getSelector(3, 'border', '.color-field'))).to.eql('#000000');
			expect(browser.evaluate(getSelector(3, 'border', '.radius-field'))).to.eql(0);
			expect(browser.evaluate(getSelector(3, 'border', '.size-field'))).to.eql(0);
	
		});
	});
	
	describe('#changes the config values', function(){
		
		it('should be able to change main slider values', function(done){
			var newTitle = "new presentation title",
				newIdx = 1;
				
			browser.evaluate("$('#txtTitle').val('" + newTitle + "').trigger('change');");
			
			//add a new slider to the right for change the index
			browser.evaluate("$('#nextSlide.addSlide').trigger('click');");
			browser.evaluate("$('#txtInitIndex').val('" + newIdx + "').trigger('change');");
			
			browser.wait(function(){
				expect(browser.evaluate("document.title")).to.equal(newTitle);
				expect(browser.evaluate("$('#slider-list li.current').index();")).to.eql(newIdx);
				
				browser.wait(function(){
				 browser
					.fill("passcode", newSlider.passcode)
					.pressButton("OK", function(){
						
						expect(browser.evaluate("$('#txtTitle').val();")).to.eql(newTitle);
						expect(browser.text("title")).to.equal(newTitle);
						expect(browser.evaluate("$('#txtInitIndex').val();")).to.eql(newIdx);
						
						browser.visit("http://localhost:3000/slider");
						done();
					});
				});
			});
		});
		
		it('should be able to change fonts, borders and backgrounds', function(done){
			
			var values = {
				main: {
					bg: "#1b56e0"
				},
				all: {
					bg: "#46e01b",
					font: {
						color:"#58b6b8",
						name: "\"Comic Sans MS\",cursive"
					},
					border:{
						color: "#b858b4",
						radius: "10",
						size: "1"
					}
				},
				chapter: {
					bg: "#b87a58",
					font: {
						color:"#b8b658",
						name:"\"Comic Sans MS\",cursive"
					},
					border:{
						color: "#58b87d",
						radius: "20",
						size: "2"
					}
				}
			};
			
			function setSelector(idx, type, selector, value){
				return "$('.style-container').eq(" + idx + ").find('div." + type + " " + selector + "').val('" + value.toLowerCase() + "').trigger('blur').trigger('change');";
			}
			
			//Main background
			browser.evaluate(setSelector(1, 'background', '.color-field', values.main.bg));
			
			//All
			browser.evaluate(setSelector(2, 'background', '.color-field', values.all.bg));
			
			browser.evaluate(setSelector(2, 'font', '.color-field', values.all.font.color));
			browser.evaluate(setSelector(2, 'font', '.fontName-field', values.all.font.name));
			
			browser.evaluate(setSelector(2, 'border', '.color-field', values.all.border.color));
			browser.evaluate(setSelector(2, 'border', '.radius-field', values.all.border.radius));
			browser.evaluate(setSelector(2, 'border', '.size-field', values.all.border.size));
			
			//Chapter
			browser.evaluate(setSelector(3, 'background', '.color-field', values.chapter.bg));
			
			browser.evaluate(setSelector(3, 'font', '.color-field', values.chapter.font.color));
			browser.evaluate(setSelector(3, 'font', '.fontName-field', values.chapter.font.name));
			
			browser.evaluate(setSelector(3, 'border', '.color-field', values.chapter.border.color));
			browser.evaluate(setSelector(3, 'border', '.radius-field', values.chapter.border.radius));
			browser.evaluate(setSelector(3, 'border', '.size-field', values.chapter.border.size));
				
			browser.wait(function(){
			
				function getSelector(idx, type, selector){
					return "$('.style-container').eq(" + idx + ").find('div." + type + " " + selector + "').val().toLowerCase();";
				}
				
				//Main background
				expect(browser.evaluate(getSelector(1, 'background', '.color-field'))).to.eql(values.main.bg);
				
				//All
				expect(browser.evaluate(getSelector(2, 'background', '.color-field'))).to.eql(values.all.bg);
				
				expect(browser.evaluate(getSelector(2, 'font', '.color-field'))).to.eql(values.all.font.color);
				expect(browser.evaluate(getSelector(2, 'font', '.fontName-field'))).to.eql(values.all.font.name);
				
				expect(browser.evaluate(getSelector(2, 'border', '.color-field'))).to.eql(values.all.border.color);
				expect(browser.evaluate(getSelector(2, 'border', '.radius-field'))).to.eql(values.all.border.radius);
				expect(browser.evaluate(getSelector(2, 'border', '.size-field'))).to.eql(values.all.border.size);
				
				//Chapter
				expect(browser.evaluate(getSelector(3, 'background', '.color-field'))).to.eql(values.chapter.bg);
				
				expect(browser.evaluate(getSelector(3, 'font', '.color-field'))).to.eql(values.chapter.font.color);
				expect(browser.evaluate(getSelector(3, 'font', '.fontName-field'))).to.eql(values.chapter.font.name);
				
				expect(browser.evaluate(getSelector(3, 'border', '.color-field'))).to.eql(values.chapter.border.color);
				expect(browser.evaluate(getSelector(3, 'border', '.radius-field'))).to.eql(values.chapter.border.radius);
				expect(browser.evaluate(getSelector(3, 'border', '.size-field'))).to.eql(values.chapter.border.size);
				
				done();
			});
		});
		
	});
	
});