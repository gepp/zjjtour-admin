package com.jdk2010.base.captcha;

import java.awt.Color;
import java.awt.Font;

import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.FileReaderRandomBackgroundGenerator;
import com.octo.captcha.component.image.color.RandomListColorGenerator;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator;
import com.octo.captcha.component.image.textpaster.DecoratedRandomTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.textpaster.textdecorator.TextDecorator;
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator;
import com.octo.captcha.component.word.wordgenerator.WordGenerator;
import com.octo.captcha.engine.image.ListImageCaptchaEngine;
import com.octo.captcha.image.gimpy.GimpyFactory;
  
public class CaptchaEngineEx extends ListImageCaptchaEngine {  
    public static final String FILE_SEPARATOR = System.getProperties().getProperty("file.separator");
    private static final String IMAGE_PATH =""+FILE_SEPARATOR+"com"+FILE_SEPARATOR+"jdk2010"+FILE_SEPARATOR+"base"+FILE_SEPARATOR+"captcha"+FILE_SEPARATOR;// 随机背景图片路径

     private static final Integer MIN_WORD_LENGTH = 4;// 验证码最小长度
	 private static final Integer MAX_WORD_LENGTH = 4;// 验证码最大长度
	 private static final Integer IMAGE_HEIGHT = 46;// 验证码图片高度
	 private static final Integer IMAGE_WIDTH = 114;// 验证码图片宽度
	 private static final Integer MIN_FONT_SIZE =16;// 验证码最小字体
	 private static final Integer MAX_FONT_SIZE =16;// 验证码最大字体
	 private static final String RANDOM_WORD = "1234567890";// 随机字符
	// 验证码随机字体
		 private static final Font[] RANDOM_FONT = new Font[] { 
		   new Font("nyala", Font.BOLD, MIN_FONT_SIZE), 
		   new Font("Arial", Font.BOLD, MIN_FONT_SIZE),
		   new Font("Bell MT", Font.BOLD, MIN_FONT_SIZE), 
		   new Font("Credit valley", Font.BOLD, MIN_FONT_SIZE),
		   new Font("Impact", Font.BOLD, MIN_FONT_SIZE) 
		 };
		 // 验证码随机颜色
		 private static final Color[] RANDOM_COLOR = new Color[] { 
		   new Color(255, 255, 255), 
		   new Color(255, 220, 220), 
		   new Color(220, 255, 255), 
		   new Color(220, 220, 255),
		   new Color(255, 255, 220), 
		   new Color(220, 255, 220) 
		 };
		 // 生成验证码
		 @Override
		 protected void buildInitialFactories() {
		  RandomListColorGenerator randomListColorGenerator = new RandomListColorGenerator(RANDOM_COLOR);// 验证码随机颜色
		  BackgroundGenerator backgroundGenerator = new FileReaderRandomBackgroundGenerator(IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_PATH); //验证码背景图片
		  WordGenerator wordGenerator = new RandomWordGenerator(RANDOM_WORD);
		  FontGenerator fontGenerator = new RandomFontGenerator(MIN_FONT_SIZE, MAX_FONT_SIZE, RANDOM_FONT);// 验证码随机字体
		  TextDecorator[] textDecorator = new TextDecorator[] {};
		  TextPaster textPaster = new DecoratedRandomTextPaster(MIN_WORD_LENGTH, MAX_WORD_LENGTH, randomListColorGenerator, textDecorator);
		  WordToImage wordToImage = new ComposedWordToImage(fontGenerator, backgroundGenerator, textPaster);
		  addFactory(new GimpyFactory(wordGenerator, wordToImage));
		 }
}  