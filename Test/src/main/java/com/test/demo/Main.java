package com.test.demo;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.slf4j.Logger;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Main {
	
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(Main.class);
	static int value = 10;
		public static void main(String[] args) {
		
			ExecutorService executorService = Executors.newFixedThreadPool(3);
			
			Runnable runnable = getRunnable(13);
			Runnable runnable1 = getRunnable(16);
			Runnable runnable2 = getRunnable(17);
		        
		        Future future = executorService.submit(runnable);
		        
		        try {
		            future.get();
		            System.out.println("[작업 처리 완료]");
		        } catch (InterruptedException e) {
		            e.printStackTrace();
		        } catch (ExecutionException e) {
		            e.printStackTrace();
		        }
		        executorService.shutdown();
		}
		
		private static Runnable getRunnable(final int i) {
			return new Runnable() {

				@Override
				public void run() {
					value = i;
					System.out.println(value);
				}
				
			};
		}
		
}
