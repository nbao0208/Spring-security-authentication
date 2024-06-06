package com.baonguyen.springwithjwt.service;

import com.baonguyen.springwithjwt.constant.SecuritySecretKey;
import com.baonguyen.springwithjwt.constant.TokenInformation;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;

@Service
public class JwtService {
  public String generateToken(Map<String, Objects> claims, UserDetails userDetails) {
    return Jwts.builder()
            .setClaims(claims)
            .setSubject(userDetails.getUsername())
            .setIssuedAt(new Date(System.currentTimeMillis()))
            .setExpiration(new Date(System.currentTimeMillis() + TokenInformation.expirationTime))
            .signWith(this.getSignInKey(), SignatureAlgorithm.HS256)
            .compact();
  }

  public String generateToken(UserDetails userDetails) {
    return this.generateToken(new HashMap<>(), userDetails);
  }

  public boolean isTokenValid(String token, UserDetails userDetails) {
    return this.extractUserName(token).equals(userDetails.getUsername()) && !this.isTokenExpired(token);
  }

  private boolean isTokenExpired(String token) {
    return this.extractExpiration(token).before(new Date());
  }

  public String extractUserName(String token) {
    return this.extractClaim(token, Claims::getSubject);
  }

  public String extractUserId(String token) {
    return this.extractClaim(token, Claims::getId);
  }

  public Date extractExpiration(String token) {
    return this.extractClaim(token, Claims::getExpiration);
  }

  private <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
    return claimsResolver.apply(this.extractAllClaims(token));
  }

  private Claims extractAllClaims(String token) {
    return Jwts.parserBuilder().setSigningKey(this.getSignInKey()).build().parseClaimsJws(token).getBody();
  }

  private Key getSignInKey() {
    byte[] keyBytes = Decoders.BASE64.decode(SecuritySecretKey.SECRET_KEY);
    return Keys.hmacShaKeyFor(keyBytes);
  }
}
