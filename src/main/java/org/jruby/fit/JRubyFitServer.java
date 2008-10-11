package org.jruby.fit;

import fit.FitServer;
import fit.Fixture;

import org.jruby.Ruby;
import org.jruby.RubyInstanceConfig;
import org.jruby.javasupport.JavaEmbedUtils;
import org.jruby.runtime.builtin.IRubyObject;

import java.util.ArrayList;

class JRubyFitServer extends FitServer
{

    public static void main(String[] argv) throws Exception
    {
	JRubyFitServer fitServer = new JRubyFitServer();
	fitServer.run(argv);
	System.exit(fitServer.exitCode());
    }

    public void test() 
    {
	newFixture();
    }
    

    protected Fixture newFixture() 
    {
	RubyInstanceConfig config = new RubyInstanceConfig();
	Ruby runtime = JavaEmbedUtils.initialize(new ArrayList(), config);
	runtime.evalScriptlet("require 'fit/jruby_fixture'");
	Object jrubyFixture = runtime.evalScriptlet("JRubyFixture.new");
	Fixture javaJrubyFixture = (Fixture) JavaEmbedUtils.rubyToJava(runtime, (IRubyObject) jrubyFixture, Fixture.class);
	javaJrubyFixture.listener = fixtureListener;
	return fixture;
    }
    
}