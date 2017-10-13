function [ y ] = someSystem( x )
%It is some equasion describing system, which our network will learn to
y = x.^3 +2.*x.^2 
end