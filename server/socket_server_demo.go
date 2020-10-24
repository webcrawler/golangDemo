package main

import (
	"bytes"
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
		log.Printf("val:%d", binary.LittleEndian.Uint32(buf[:n])) // LittleEndian  BigEndian

		// write to the connection
		log.Println("start to write")
		//words := "22"
		//c.Write([]byte(words))


		// add by joke
		type A struct {
			One int16
			Two int32
			Three int8
			Four float32
			Five float64
		}
		var a A
		a.One = int16(2 + 4 + 1 + 4 + 8) // 2 + 4 + 5
		a.Two = int32(123654)
		a.Three = int8(8)
		a.Four = float32(123.123)
		a.Five = float64(123654789)
		var bufxx = new(bytes.Buffer)
		binary.Write(bufxx,binary.LittleEndian,a) // LittleEndian
		c.Write(bufxx.Bytes())

		//type Packet struct {
		//	size int32
		//	data int32
		//}
		//var buffer bytes.Buffer
		//var packet = new(Packet)
		//packet.size = 8
		//packet.data = 123654
		//binary.Write(&buffer, binary.BigEndian, &packet)
		//c.Write(buffer.Bytes())
	}
}

func main() {
	// l, err := net.Listen("tcp", "127.0.0.1:8888")
	l, err := net.Listen("tcp", "10.10.10.3:8077")
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
