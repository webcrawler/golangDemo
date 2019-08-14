package main

import (
	"encoding/binary"
	"log"
	"net"
)

func handleConn(c net.Conn) {
	defer c.Close()
	for {
		// read from the connection
		var buf = make([]byte, 10)
		log.Println("start to read from conn")
		n, err := c.Read(buf)
		if err != nil {
			log.Println("conn read err:", err)
			return
		}
		log.Printf("read %d bytes, content is:%s\n", n, string(buf[:n]))
		log.Printf("val:%d", binary.BigEndian.Uint32(buf[:n])) // LittleEndian  BigEndian

		// write to the connection
		log.Println("start to write")
		words := "1234567890"
		c.Write([]byte(words))
	}
}

func main() {
	l, err := net.Listen("tcp", "127.0.0.1:8888")
	if err != nil {
		log.Println("error listen:", err)
		return
	}

	defer l.Close()
	log.Println("listen ok")

	var i int
	for {
		c, err := l.Accept()
		if err != nil {
			log.Println("accept error:", err)
			break
		}
		i++
		log.Printf("%d: accept a new connection\n", i)

		// start a new goroutine to handle
		// the new connection.
		go handleConn(c)
	}
}
