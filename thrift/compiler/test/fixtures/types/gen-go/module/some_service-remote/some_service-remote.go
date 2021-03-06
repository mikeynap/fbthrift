// Autogenerated by Thrift Compiler (facebook)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
// @generated

package main

import (
        "flag"
        "fmt"
        "math"
        "net"
        "net/url"
        "os"
        "strconv"
        "strings"
        thrift "github.com/facebook/fbthrift-go"
        "../../module"
)

func Usage() {
  fmt.Fprintln(os.Stderr, "Usage of ", os.Args[0], " [-h host:port] [-u url] [-f[ramed]] function [arg1 [arg2...]]:")
  flag.PrintDefaults()
  fmt.Fprintln(os.Stderr, "\nFunctions:")
  fmt.Fprintln(os.Stderr, "  SomeMap bounce_map(SomeMap m)")
  fmt.Fprintln(os.Stderr, "   binary_keyed_map( r)")
  fmt.Fprintln(os.Stderr)
  os.Exit(0)
}

func main() {
  flag.Usage = Usage
  var host string
  var port int
  var protocol string
  var urlString string
  var framed bool
  var useHttp bool
  var parsedUrl url.URL
  var trans thrift.Transport
  _ = strconv.Atoi
  _ = math.Abs
  flag.Usage = Usage
  flag.StringVar(&host, "h", "localhost", "Specify host")
  flag.IntVar(&port, "p", 9090, "Specify port")
  flag.StringVar(&protocol, "P", "binary", "Specify the protocol (binary, compact, simplejson, json)")
  flag.StringVar(&urlString, "u", "", "Specify the url")
  flag.BoolVar(&framed, "framed", false, "Use framed transport")
  flag.BoolVar(&useHttp, "http", false, "Use http")
  flag.Parse()
  
  if len(urlString) > 0 {
    parsedUrl, err := url.Parse(urlString)
    if err != nil {
      fmt.Fprintln(os.Stderr, "Error parsing URL: ", err)
      flag.Usage()
    }
    host = parsedUrl.Host
    useHttp = len(parsedUrl.Scheme) <= 0 || parsedUrl.Scheme == "http"
  } else if useHttp {
    _, err := url.Parse(fmt.Sprint("http://", host, ":", port))
    if err != nil {
      fmt.Fprintln(os.Stderr, "Error parsing URL: ", err)
      flag.Usage()
    }
  }
  
  cmd := flag.Arg(0)
  var err error
  if useHttp {
    trans, err = thrift.NewHTTPPostClient(parsedUrl.String())
  } else {
    portStr := fmt.Sprint(port)
    if strings.Contains(host, ":") {
           host, portStr, err = net.SplitHostPort(host)
           if err != nil {
                   fmt.Fprintln(os.Stderr, "error with host:", err)
                   os.Exit(1)
           }
    }
    trans, err = thrift.NewSocket(thrift.SocketAddr(net.JoinHostPort(host, portStr)))
    if err != nil {
      fmt.Fprintln(os.Stderr, "error resolving address:", err)
      os.Exit(1)
    }
    if framed {
      trans = thrift.NewFramedTransport(trans)
    }
  }
  if err != nil {
    fmt.Fprintln(os.Stderr, "Error creating transport", err)
    os.Exit(1)
  }
  defer trans.Close()
  var protocolFactory thrift.ProtocolFactory
  switch protocol {
  case "compact":
    protocolFactory = thrift.NewCompactProtocolFactory()
    break
  case "simplejson":
    protocolFactory = thrift.NewSimpleJSONProtocolFactory()
    break
  case "json":
    protocolFactory = thrift.NewJSONProtocolFactory()
    break
  case "binary", "":
    protocolFactory = thrift.NewBinaryProtocolFactoryDefault()
    break
  default:
    fmt.Fprintln(os.Stderr, "Invalid protocol specified: ", protocol)
    Usage()
    os.Exit(1)
  }
  client := module.NewSomeServiceClientFactory(trans, protocolFactory)
  if err := trans.Open(); err != nil {
    fmt.Fprintln(os.Stderr, "Error opening socket to ", host, ":", port, " ", err)
    os.Exit(1)
  }
  
  switch cmd {
  case "bounce_map":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "BounceMap requires 1 args")
      flag.Usage()
    }
    arg30 := flag.Arg(1)
    mbTrans31 := thrift.NewMemoryBufferLen(len(arg30))
    defer mbTrans31.Close()
    _, err32 := mbTrans31.WriteString(arg30)
    if err32 != nil { 
      Usage()
      return
    }
    factory33 := thrift.NewSimpleJSONProtocolFactory()
    jsProt34 := factory33.GetProtocol(mbTrans31)
    containerStruct0 := module.NewSomeServiceBounceMapArgs()
    err35 := containerStruct0.ReadField1(jsProt34)
    if err35 != nil {
      Usage()
      return
    }
    argvalue0 := containerStruct0.M
    value0 := module.SomeMap(argvalue0)
    fmt.Print(client.BounceMap(value0))
    fmt.Print("\n")
    break
  case "binary_keyed_map":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "BinaryKeyedMap requires 1 args")
      flag.Usage()
    }
    arg36 := flag.Arg(1)
    mbTrans37 := thrift.NewMemoryBufferLen(len(arg36))
    defer mbTrans37.Close()
    _, err38 := mbTrans37.WriteString(arg36)
    if err38 != nil { 
      Usage()
      return
    }
    factory39 := thrift.NewSimpleJSONProtocolFactory()
    jsProt40 := factory39.GetProtocol(mbTrans37)
    containerStruct0 := module.NewSomeServiceBinaryKeyedMapArgs()
    err41 := containerStruct0.ReadField1(jsProt40)
    if err41 != nil {
      Usage()
      return
    }
    argvalue0 := containerStruct0.R
    value0 := argvalue0
    fmt.Print(client.BinaryKeyedMap(value0))
    fmt.Print("\n")
    break
  case "":
    Usage()
    break
  default:
    fmt.Fprintln(os.Stderr, "Invalid function ", cmd)
  }
}
