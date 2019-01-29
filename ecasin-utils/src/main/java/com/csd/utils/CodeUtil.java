package com.csd.utils;

import com.csd.utils.entity.CodeImage;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:10.
 */
public class CodeUtil {

    private static final char[] CHARS =
            {
                    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
                    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
            };

    private static final int SIZE = 4;// 验证码字符数量

    private static final int LINES = 19;// 验证码干扰线数量

    private static final int WIDTH = 90;// 验证码图片宽度

    private static final int HEIGHT = 36;// 验证码图片长度

    private static final int FONT_SIZE = 20;// 验证码字体大小

    private static final int EXPIREIN = 60;// 验证码有效时间 60s

    private static BufferedImage buffImg = null;// 创建图片

    public static CodeImage createImageCode() {
        buffImg = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        //定义随机数类
        Random r = new Random();
        //定义存储验证码的类
        StringBuilder builderCode = new StringBuilder();
        //得到画笔
        Graphics g = buffImg.getGraphics();
        //1.设置颜色,画边框
        g.setColor(Color.gray);
        g.drawRect(0,0,WIDTH,HEIGHT);
        //2.设置颜色,填充内部
        g.setColor(Color.white);
        g.fillRect(1,1,WIDTH-2,HEIGHT-2);
        //3.设置干扰线
        // g.setColor(Color.gray);
        for (int i = 0; i < LINES; i++) {
            int _R = (int)Math.floor(Math.random()*256);
            int _G = (int)Math.floor(Math.random()*256);
            int _B = (int)Math.floor(Math.random()*256);
            g.setColor(new Color(_R, _G, _B, 255));
            g.drawLine(r.nextInt(WIDTH),r.nextInt(WIDTH),r.nextInt(WIDTH),r.nextInt(WIDTH));
        }
        //4.设置验证码
        g.setColor(Color.blue);
        //4.1设置验证码字体
        g.setFont(new Font("宋体",Font.BOLD|Font.ITALIC,FONT_SIZE));
        for (int i = 0; i < SIZE; i++) {
            char c = CHARS[r.nextInt(CHARS.length)];
            builderCode.append(c);
            g.drawString(c+"",((WIDTH/SIZE)*i+2),HEIGHT*4/5);
        }

        return new CodeImage(buffImg, builderCode.toString(), EXPIREIN);
    }

}
