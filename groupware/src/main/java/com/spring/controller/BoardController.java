package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardController {

   @GetMapping("/boardMain")
   public void main() {
      log.info("                    ̵  մϴ .");
   }
   
   @GetMapping("/boardRead")
   public void read() {
      log.info("         Խù            ̵ ");
   }
   
   
   @GetMapping("/boardWriter")
   public void writer() {
      log.info("          ۼ            ̵ ");
   }
   
   
   @GetMapping("/boardModify")
   public void moidfy() {
      log.info("                        ̵ ");
   }
}